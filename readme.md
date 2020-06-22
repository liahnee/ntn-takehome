# National Testing Network take-home by Catherine Yang

This project was written with CFML in MVC pattern with ColdBox framework which supports Lucee and Adobe ColdFusion application servers.

## To run the application in local environment

1. Git clone the repo into your local directory.
2. In order to run the server, you need to [download commandbox](https://www.ortussolutions.com/products/commandbox#download).
3. After you start the commandbox, cd into the local git repo directory. 
4. In your commandbox, run following installations.
<pre><code>install coldbox
install cborm,cborm@be,commandbox-dotenv,commandbox-cfconfig
</code></pre>
5. Update the .env file to connect to your local MySQL databse. 
6. The create database and tables. SQL queries are documented below. 
7. Run the server:
<pre><code>server start</code></pre>
The page should load automatically. If not, you can run 'server list' to find the local url. 

## Pages

<strong>Main Page</strong><br/>
Main page is the default page. It has cfform for the scheduler to make reservation for the exam.
Exams are fetched from database.

![Image of loading exams, main index page](/loadingExams.png)
<br/>

Then, on selecting the exam, available testing centers and dates are loaded into the dropdown selection. 
![Image of loading testing center and date options, main index page](/loadingTcsAndDates.png)
![Image of loaded testing centers and dates, main index page](/loadedTcsAndDates.png)


<strong>Confirmation Page</strong><br/>
Scheduler is directed to confirmation page on submit. The page displays full name, exam name, testing center name, and automatically generated receipt number for the reservation. 

![Image of main confirmation page](/ConfirmationPage.png)

## MySQL and Database structure

<strong>TABLE exams</strong>

Columns: exam_id, name
<pre><code>CREATE TABLE exams (exam_id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20) NOT NULL);</code></pre>

<strong>TABLE testingcenters</strong>

Columns: testingcenter_id, name
<pre><code>CREATE TABLE testingcenters (testingcenter_id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20) NOT NULL);</code></pre>

<strong>TABLE examdates </strong>

Columns: examdate, date, exam_id
<pre><code>CREATE TABLE examdate (examdate_id INT NOT NULL AUTO_INCREMENT, date DATETIME NOT NULL, exam_id INT NOT NULL, FOREIGN KEY(exam_id) REFERENCES exams(exam_id) ON DELETE CASCADE ON UPDATE CASCADE);</code></pre>

<strong> TABLE examtcs </strong>

Columns: examtc_id, exam_id, testingcenter_id, testingcenter_name
<pre><code>CREATE TABLE examtcs (examtc_id INT NOT NULL AUTO_INCREMENT, exam_id INT NOT NULL, testingcenter_name VARCHAR(20) NOT NULL, testingcenter_id INT NOT NULL, PRIMARY KEY(examtc_id), FOREIGN KEY(exam_id) REFERENCES exams(exam_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(testingcenter_name) REFERENCES testingcenters(name) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(testingcenter_id) REFERENCES testingcenters(testingcenter_id) ON DELETE CASCADE ON UPDATE CASCADE);</code></pre>

<strong>TABLE reservations</strong>

Columns: reservation_id, first_name, last_name, exam_id, testingcenter_id, receipt_number, date
<pre><code>CREATE TABLE reservations (reservation_id INT NOT NULL AUTO_INCREMENT, first_name varchar(20) NOT NULL, last_name VARCHAR(20) NOT NULL, receipt_number VARCHAR(40) NOT NULL, exam_id INT NOT NULL, testingcenter_id INT NOT NULL, PRIMARY KEY(reservation_id), FOREIGN KEY(exam_id) REFERENCES exams(exam_id), FOREIGN KEY(testingcenter_id) REFERENCES testingcenters(testingcenter_id));</code></pre>

## Mobile/Laptop view
At 1200px or larger width, width is fixed. 
At 800px or smaller with, the options' flex-direction are set to column.

## Updates nedded 

Tests, fetch failure response, login, edit reservation per receipt/login, etc

## Resources
Coldbox documents: https://coldbox.ortusbooks.com/

Coldbox ORM documents: https://coldbox-orm.ortusbooks.com/getting-started/basic-crud-services