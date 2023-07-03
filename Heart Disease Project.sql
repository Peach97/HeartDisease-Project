--SELECT age, sex, (age/[resting blood pressure]) AS [blood pressure increase rate], [heart disease]
--FROM [SDG Portfolio Project].dbo.HeartDisease

-- heart disease = 1 then positive
--heart disease = 2 then negative

--SELECT AVG(age/[resting blood pressure]) AS [dangerous blood pressure increase per year (age adjusted)], AVG(age)
--FROM [SDG Portfolio Project].dbo.HeartDisease
--WHERE [heart disease] = 2

--SELECT AVG(age/[resting blood pressure]) * 1.07 AS [healthy blood pressure increase per year (age adjusted)], AVG(age)
--FROM [SDG Portfolio Project].dbo.HeartDisease
--WHERE [heart disease] = 1

-- years of age * blood pressure increase rate shows likelihood of developing heart disease

-- when adjusted for age those with heart disease present have lower increased blood pressure per year

--SELECT AVG([resting blood pressure]) AS [Average Resting Blood Pressure (Positive Heart Disease)]
--FROM [SDG Portfolio Project].dbo.HeartDisease
--WHERE [heart disease] = 2

--SELECT AVG([resting blood pressure]) * 1.07 AS [Average Resting Blood Pressure (Negative Heart Disease Age Adjusted)]
--FROM [SDG Portfolio Project].dbo.HeartDisease
--WHERE [heart disease] = 1

-- resting blood pressure not accurate variable in predicting heart disease from this data

-- Looking at average resting blood pressure with likelihood of heart disease

SELECT AVG([resting blood pressure]) AS [Average Resting Blood Pressure (Positive Heart Disease)]
FROM [SDG Portfolio Project].dbo.HeartDisease
WHERE [heart disease] = 2 AND age >= 62

SELECT AVG([resting blood pressure]) AS [Average Resting Blood Pressure (Negative Heart Disease)]
FROM [SDG Portfolio Project].dbo.HeartDisease
WHERE [heart disease] = 1 AND age >= 62

-- Looking at exercise induces angina

SELECT AVG([exercise induced angina]) * 100 AS [Angina rate (Negative)], AVG([max heart rate]) AS [Max Heart Rate During Exercise]
FROM [SDG Portfolio Project].dbo.HeartDisease
WHERE [heart disease] = 1 AND age >= 62

SELECT AVG([exercise induced angina]) * 100 AS [Angina rate (Positive)], AVG([max heart rate]) AS [Max Heart Rate During Exercise]
FROM [SDG Portfolio Project].dbo.HeartDisease
WHERE [heart disease] = 2 AND age >= 62

--Looking at percent total over 62 with heart disease

SELECT [heart disease],
	COUNT([heart disease])/(SELECT count([heart disease]) FROM [SDG Portfolio Project].dbo.HeartDisease WHERE [heart disease] = 2)
FROM [SDG Portfolio Project].dbo.HeartDisease
GROUP BY [heart disease]

--SELECT [heart disease], 
--	COUNT([heart disease])/(SELECT COUNT(*) FROM [SDG Portfolio Project].dbo.HeartDisease) AS [Percentage Heart Disease]
--FROM [SDG Portfolio Project].dbo.HeartDisease
--WHERE [heart disease] = 2
--GROUP BY [heart disease]

SELECT (cast(count([heart disease]) as decimal(7,2))/(select cast(count(*) as decimal(7,2)) from [SDG Portfolio Project].dbo.HeartDisease)) * 100 AS [Percent Total Heart Disease]
FROM [SDG Portfolio Project].dbo.HeartDisease
WHERE age >= 62
GROUP BY [heart disease]





