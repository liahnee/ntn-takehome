

document.addEventListener("DOMContentLoaded", () => {
    async function getExamList() {
        const examList = await fetch("/exams")
            .then(resp => {
                document.getElementById("exams-loading").remove();
                return resp.json()
            })
            .then(data => {
                return data;
            })
            .catch(err => {
                console.log("fetch exam list error:", err)
            })
        return examList;
    }

    async function renderExamLists() {
        const exams = document.getElementById('exams');
        const examLists = await getExamList();
        examLists.forEach( (exam) => {
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
            .then(resp => {
                const loadingText = document.getElementById("examdates-loading");
                if (loadingText !== null && loadingText !== undefined ) {
                    loadingText.remove();
                }
                return resp.json()
            })
            .then(data => {
                console.log(data)
                return data;
            })
            .catch(err => {
                console.log("fetch exam dates error:", err)
            })
    }
    
    async function renderExamdates(exam_id) {
        const div = document.getElementById('examdates-div');
        if (!document.getElementById('examdates-loading')) {
            const p = newLoadingText('examdates-loading');
            div.appendChild(p);
        }

        const select = document.getElementById('examdates');
        select.innerHTML = "";
        const examDates = await getExamDates(exam_id);
        examDates.forEach( date => {
            const option = document.createElement("option");
            option.setAttribute("value", date.examdate_id);
            option.append(date.date);
            select.appendChild(option)
        });
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
            .then(resp => {
                let loadingText = document.getElementById("testingcenters-loading");
                if (loadingText !== null && loadingText !== undefined) {
                    loadingText.remove();
                }
                return resp.json()
            })
            .then(data => {
                return data;
            })
            .catch(err => {
                console.log("fetch examtc error:", err)
            })
    }

    async function renderExamTcs(exam_id) {
        const div = document.getElementById('testingcenters-div');
        if (!document.getElementById('testingcenters-loading')) {
            const p = newLoadingText('testingcenters-loading');
            div.appendChild(p);
        }
        const select = document.getElementById('testingcenters');
        select.innerHTML = "";
        const examTcs = await getExamTcs(exam_id);
        examTcs.forEach( tc => {
            const option = document.createElement("option");
            option.setAttribute("value", tc.testingcenter_id);
            option.append(tc.testingcenter_name);
            select.appendChild(option)
        })
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

// function addDisabledOption() {
//     const option = document.createElement("option");
//     option.disabled = true;
//     option.selected = true;
//     option.text = "Select your exam";
//     return option;
// }
