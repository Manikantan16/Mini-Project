### Evaluation of Data Analytics Course Sessions - MiniCapstone Project
- Its a Mini Capstone Project to Analyse the Data Analytics Classes.
- Classes commenced on 16th October and ended on 15 Feb so took the insights and visualized the data using different tools such as:<br/> 
  - **MySql**<br/> 
  - **PowerBi Desktop** <br/> 
  - **Python (Jupyter Notebook)** <br/> 
 - Created an excel and drilled down / categorized the classes based on various factors such as:<br/>
     - **Working Days (W)**  - Classes held on regular week days.<br/>
     - **Class Test  (CT)** - Online Tests conducted during the course.<br/>
     - **Weekly Off  (WO)** - Week Ends (2nd,4th Saturday) and all sundays, during which no classes were held.<br/>
     - **Public Holiday (PH)** - Days designated as Public Holidays (Deepawali,Christmas,New Year eve, Pongal).<br/>
     - **Sick Leave  (SL)**  - Instances where classes were cancelled due to trainers illness.<br/>
  - The first 2 categories (W,CT) are considered as **Classes/Class Days**, while the last 3 (WO,PH,SL) are categorized as **No Classes / Non-Class Days**. 
 - **MYSQL**:
      - Created an excel file with 6 sheets and converted it to csv and imported the csv data to Mysql table and wrote query for the displaying the results
      - Log in to Mysql Workbench and Select the Desired Database
      - Expand and go to tables
      - Right click tables and select **Table Data Import Wizard**
        
        ![image](https://github.com/user-attachments/assets/1f53b8be-e2c3-4c47-8cd2-25a8082efaa3)
  
       - Select the csv from your local drive by clicking browse and then click Next 

        ![Screenshot 2025-02-17 184630](https://github.com/user-attachments/assets/28664163-52ab-48c8-908a-6ac1b6df7e32)


        ![image](https://github.com/user-attachments/assets/bf2331f0-380a-4881-8451-1872026bb205)



        
      - I've also created a Stored Procedure with parameters that accepts a from-date, to-date, and day-type to display the results  
