-- Question 1. What was the Survival rate? --
SELECT
AVG(Survived) * 100 AS Survival_rate
FROM
titanic;

-- Question 2. Of the Survivors, what % was male and female? --
SELECT 
    CASE 
        WHEN Sex = 'male' THEN 'Male'
        WHEN Sex = 'female' THEN 'Female'
        ELSE 'Unknown'
    END AS Gender,
    ROUND(AVG(Survived) * 100, 2) AS survival_rate_percentage
FROM titanic
GROUP BY Gender;

-- Question 3. What was the Survival rate by passenger class? --
SELECT
	CASE
    WHEN Pclass = 1 THEN 'First class'
    WHEN Pclass = 2 THEN 'Second class'
    WHEN Pclass = 3 THEN 'Third class'
    else 'UNKNOWN Class'
END AS Passenger_class,
ROUND(AVG(Survived) * 100, 2) AS survival_rate_percentage
FROM titanic
GROUP BY Pclass
ORDER BY Pclass;

-- Question 4. What was the Average age of survivors ?--
SELECT 
    CASE 
        WHEN Survived = 1 THEN 'Survived'
    END AS Survival_Status,
    CASE 
        WHEN Sex = 'male' THEN 'Male'
        WHEN Sex = 'female' THEN 'Female'
        ELSE 'Unknown'
    END AS Gender,
    ROUND(AVG(Age), 2) AS avg_age
FROM titanic
WHERE Survived = 1
GROUP BY Survived, Sex
ORDER BY Gender;

-- Question 5. The 2 Common Embarking Ports? --
SELECT
	Embarked,
	COUNT(*) AS count_passengers
    FROM titanic
    GROUP BY Embarked
    ORDER BY count_passengers DESC
    LIMIT 2;
    
    -- Question 6. what was the Survival rate by embarkation port? --
    SELECT 
    Embarked,
    AVG(Survived) * 100 AS survival_rate
FROM Titanic
GROUP BY Embarked;

-- Question 7. The Distribution of family size? --
SELECT 
    (SibSp + Parch + 1) AS family_size,
    COUNT(*) AS num_passengers
FROM Titanic
GROUP BY family_size
ORDER BY family_size;

-- Question 8. The Highest Fare Paid --
SELECT 
    Name,
    Fare,
    Pclass,
    Sex,
    Age
FROM Titanic
ORDER BY Fare DESC
LIMIT 5;
--  The  Survival rate across men, women and children --
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child'
        ELSE Sex
    END AS group_type,
    AVG(Survived) * 100 AS survival_rate
FROM Titanic
GROUP BY group_type;




