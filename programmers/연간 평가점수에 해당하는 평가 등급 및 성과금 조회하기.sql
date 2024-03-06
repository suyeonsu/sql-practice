SELECT EMP.EMP_NO, EMP_NAME, GRADE, SAL*RATE BONUS
FROM HR_EMPLOYEES EMP 
    JOIN (
        SELECT EMP_NO, 
            CASE 
                WHEN AVG(SCORE) >= 96 THEN 'S'
                WHEN AVG(SCORE) >= 90 THEN 'A'
                WHEN AVG(SCORE) >= 80 THEN 'B'
                ELSE 'C'
                END GRADE,

            CASE 
                WHEN AVG(SCORE) >= 96 THEN 0.2
                WHEN AVG(SCORE) >= 90 THEN 0.15
                WHEN AVG(SCORE) >= 80 THEN 0.1
                ELSE 0
                END RATE
        FROM HR_GRADE
        GROUP BY EMP_NO
    ) G
    ON EMP.EMP_NO = G.EMP_NO
ORDER BY EMP.EMP_NO
