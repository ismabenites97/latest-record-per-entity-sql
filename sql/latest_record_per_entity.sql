-- Identifica o registro mais recente por entidade
WITH LATEST_RECORD_BY_ENTITY AS (
    SELECT
        ranked_latest.entity_id,
        ranked_latest.entity_code,
        ranked_latest.record_id
    FROM (
        SELECT
            hist.entity_id,
            hist.entity_code,
            hist.record_id,
            ROW_NUMBER() OVER (
                PARTITION BY hist.entity_id
                ORDER BY rec.record_id DESC
            ) AS rn_latest
        FROM entity_history hist
        INNER JOIN records rec
            ON rec.record_id = hist.record_id
    ) ranked_latest
    WHERE ranked_latest.rn_latest = 1
)

SELECT
    rec.record_id,
    rec.entity_code
FROM LATEST_RECORD_BY_ENTITY ent
INNER JOIN records rec
    ON rec.record_id = ent.record_id
   AND rec.entity_id  = ent.entity_id;
