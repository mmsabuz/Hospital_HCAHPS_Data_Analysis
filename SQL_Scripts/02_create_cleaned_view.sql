USE Hospital_Analysis;
GO

-- Drop view if it already exists to avoid creation errors
DROP VIEW IF EXISTS vw_HCAHPS_Cleaned;
GO

-- Create Cleaned View for Power BI
CREATE VIEW vw_HCAHPS_Cleaned AS
SELECT 
    Facility_ID,
    Facility_Name,
    Address,
    City_Town AS City,
    State,
    ZIP_Code,
    County_Parish AS County,
    Telephone_Number,
    HCAHPS_Measure_ID,
    HCAHPS_Question,
    HCAHPS_Answer_Description,
    
    -- Convert 'Not Applicable' / 'Not Available' to NULL and cast to INT
    TRY_CAST(NULLIF(NULLIF(Patient_Survey_Star_Rating, 'Not Applicable'), 'Not Available') AS INT) AS Star_Rating,
    Patient_Survey_Star_Rating_Footnote AS Star_Rating_Footnote,
    
    -- Convert Percentages to INT
    TRY_CAST(NULLIF(NULLIF(HCAHPS_Answer_Percent, 'Not Applicable'), 'Not Available') AS INT) AS Answer_Percent,
    HCAHPS_Answer_Percent_Footnote AS Answer_Percent_Footnote,
    
    -- Convert Linear Mean Values to FLOAT
    TRY_CAST(NULLIF(NULLIF(HCAHPS_Linear_Mean_Value, 'Not Applicable'), 'Not Available') AS FLOAT) AS Linear_Mean_Value,
    
    -- Convert Completed Surveys to INT
    TRY_CAST(NULLIF(NULLIF(Number_of_Completed_Surveys, 'Not Applicable'), 'Not Available') AS INT) AS Completed_Surveys,
    Number_of_Completed_Surveys_Footnote AS Completed_Surveys_Footnote,
    
    -- Convert Response Rate Percentages to INT
    TRY_CAST(NULLIF(NULLIF(Survey_Response_Rate_Percent, 'Not Applicable'), 'Not Available') AS INT) AS Response_Rate_Percent,
    Survey_Response_Rate_Percent_Footnote AS Response_Rate_Percent_Footnote,
    
    -- Convert Strings to DATE
    TRY_CAST(Start_Date AS DATE) AS Start_Date,
    TRY_CAST(End_Date AS DATE) AS End_Date

FROM [HCAHPS_Cleaned_Data.xlsx];
GO
