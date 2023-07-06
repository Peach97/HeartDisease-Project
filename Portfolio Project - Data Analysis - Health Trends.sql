--SELECT *
--FROM [Portfolio Project].dbo.[BFSS Heart Disease]

SELECT LocationDesc, ROUND(AVG(DataValue), 2) as [Average Awareness], ROUND(AVG(LowConfidenceLimit), 2) as [Low Confidence Awareness Limit], ROUND(AVG(HighConfidenceLimit), 2) as [High Confidence Awareness Limit], Question
FROM [Portfolio Project].dbo.[BFSS Heart Disease]
WHERE LocationDesc <> 'Florida'
GROUP BY Question, LocationDesc

--SELECT DISTINCT LocationDesc
--FROM [Portfolio Project].dbo.[BFSS Heart Disease]

SELECT  AVG(hd.DataValue) as [High Blood Pressure Awareness Rate],hd.LocationDesc as [Location], AVG(CAST (t.DataValue AS decimal(7,2))) as [Tobacco use rate]
FROM [Portfolio Project].dbo.[BFSS Heart Disease] hd
LEFT JOIN [Portfolio Project].dbo.[BFSS Tobacco] t
	ON hd.LocationAbbr = t.LocationAbbr
WHERE t.Question LIKE 'Current%' AND hd.LocationDesc <> 'Florida' AND hd.DataValue IS NOT NULL AND t.DataValue IS NOT NULL
GROUP BY hd.Question, hd.LocationDesc
ORDER BY [High Blood Pressure Awareness Rate] DESC
--get average awareness and tobacco use rate by location
