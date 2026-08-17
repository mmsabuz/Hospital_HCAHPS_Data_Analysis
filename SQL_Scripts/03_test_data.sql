USE Hospital_Analysis;
GO

-- Preview top 100 rows from the cleaned view
SELECT TOP 100 
    Facility_ID,
    Facility_Name,
    State,
    Star_Rating,
    Answer_Percent,
    Linear_Mean_Value,
    Completed_Surveys,
    Response_Rate_Percent,
    Start_Date,
    End_Date
FROM vw_HCAHPS_Cleaned;
GO
