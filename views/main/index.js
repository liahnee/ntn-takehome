

document.addEventListener("DOMContentLoaded", () => {
    async function getExamList() {
        const examList = await fetch("/exams")
            .then(resp => resp.json())
            .then(data => {
                return data;
            })
        return examList;
    }

    async function renderExamLists() {
        const exams = document.getElementById('exams');
        const examLists = await getExamList();
        document.getElementById("exams-loading").remove();
        examLists.forEach( exam => {
            const label = createLabel();
            label.setAttribute("class", "radio-label");
            label.setAttribute("for", "exam-option-".concat(exam.exam_id));
            const radio = createRadio();
            radio.setAttribute("id", "exam-option-".concat(exam.exam_id));
            radio.setAttribute("name", "exam_id");
            radio.setAttribute("value", exam.exam_id);
            label.appendChild(radio);
            label.append(exam.name);
            exams.appendChild(label);

            radio.onclick = () => {renderExamdates(exam.exam_id), renderExamTcs(exam.exam_id)};
        })
    }

    function getExamDates(exam_id){
        return fetch("/examdates/show",{
            method: 'post',
            headers: {
                "content-type": "application/json",
                "accept": "application/json"
            },
            body:  JSON.stringify({ exam_id })
        })
            .then(resp => resp.json())
            .then(data => {
                return data;
            })
    }
    
    async function renderExamdates(exam_id) {
        const div = document.getElementById('examdates-div');
        const p = newLoadingText('examdates-loading');
        div.appendChild(p);
        console.log("p1", p, "div", div)

        const select = document.getElementById('examdates');
        const examDates = await getExamDates(exam_id);
        examDates.forEach( date => {
            const option = document.createElement("option");
            option.setAttribute("value", date.examdate_id);
            option.append(date.date);
            select.appendChild(option)
        })
        document.getElementById("examdates-loading").remove();
    };

    function getExamTcs(exam_id){

        console.log("exam_id", exam_id)
        return fetch("/examtcs/show",{
            method: 'post',
            headers: {
                "content-type": "application/json",
                "accept": "application/json"
            },
            body:  JSON.stringify({ exam_id })
        })
            .then(resp => resp.json())
            .then(data => {
                console.log("all examtc data", data)
                return data;
            })
    }

    async function renderExamTcs(exam_id) {
        const div = document.getElementById('testingcenters-div');
        const p = newLoadingText('testingcenters-loading');
        div.appendChild(p);
        console.log("p1", p, "div", div)

        const select = document.getElementById('testingcenters');
        const examTcs = await getExamTcs(exam_id);
        examTcs.forEach( tc => {
            const option = document.createElement("option");
            option.setAttribute("value", tc.testingcenter_id);
            option.append(tc.testingcenter_name);
            select.appendChild(option)

            // const label = createLabel();
            // label.setAttribute("class", "radio-label");
            // label.setAttribute("for", "tc-option-".concat(tc.testingcenter_id));
            // const radio = createRadio();
            // radio.setAttribute("id", "tc-option-".concat(tc.testingcenter_id));
            // radio.setAttribute("name", "exam_id");
            // radio.setAttribute("value", tc.testingcenter_id);
            // label.appendChild(radio);
            // label.append(tc.testingcenter_name);
            // exams.appendChild(label);

        })

        document.getElementById("testingcenters-loading").remove();
    };

    renderExamLists();

});

function createRadio() {
    let radio = document.createElement('input');
    radio.setAttribute("type", "radio");
    radio.setAttribute("class", "radio-input");
    return radio;
}
function createLabel() {
    let label = document.createElement('label');
    return label;
}

function newLoadingText(id) {
    const p = document.createElement("p");
    const t = document. createTextNode("Loading...");
    p.appendChild(t);
    p.id = id;
    return p;
}
