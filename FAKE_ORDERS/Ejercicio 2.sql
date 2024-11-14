CREATE DATABASE IronHack_Delivery;

USE ironhack_delivery;
SELECT * FROM orders
LIMIT 5;

USE ironhack_delivery;
SELECT * FROM customer_courier_chat_messages
LIMIT 300;

CREATE TABLE customer_courier_conversations AS
SELECT
    o.order_id,
    o.city_code,
    -- Primer mensaje del repartidor (si existe)
    COALESCE(MIN(CASE WHEN m.from_id = m.courier_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END), 'No message') AS first_courier_message,
    -- Primer mensaje del cliente (si existe)
    COALESCE(MIN(CASE WHEN m.from_id = m.customer_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END), 'No message') AS first_customer_message,
    -- Número de mensajes del repartidor
    COUNT(CASE WHEN m.from_id = m.courier_id THEN 1 END) AS num_courier_messages,
    -- Número de mensajes del cliente
    COUNT(CASE WHEN m.from_id = m.customer_id THEN 1 END) AS num_customer_messages,
    -- Primer remitente de la conversación (compara el primer mensaje de cada uno)
    CASE
        WHEN MIN(STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i')) = MIN(CASE WHEN m.from_id = m.courier_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END)
        THEN 'Courier'
        ELSE 'Customer'
    END AS first_sender,
    -- Primer mensaje en la conversación (el más antiguo)
    MIN(STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i')) AS first_message_time,
    -- Tiempo hasta la primera respuesta (en segundos)
    CASE
        -- Si hay mensajes del cliente y del repartidor, calcula el tiempo hasta la primera respuesta
        WHEN MIN(CASE WHEN m.from_id = m.customer_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END) IS NOT NULL
             AND MIN(CASE WHEN m.from_id = m.courier_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END) IS NOT NULL
        THEN TIMESTAMPDIFF(SECOND,
            MIN(CASE WHEN m.from_id = m.customer_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END),
            MIN(CASE WHEN m.from_id = m.courier_id THEN STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i') END)
        )
        ELSE NULL
    END AS time_to_first_response,
    -- Último mensaje enviado en la conversación
    MAX(STR_TO_DATE(m.message_sent_time, '%d/%m/%Y %H:%i')) AS last_message_time,
    -- Etapa del pedido cuando se envió el último mensaje
    (SELECT m2.order_stage
     FROM customer_courier_chat_messages m2
     WHERE m2.order_id = m.order_id
     ORDER BY m2.message_sent_time DESC LIMIT 1) AS last_message_order_stage
FROM
    customer_courier_chat_messages m
JOIN
    orders o ON m.order_id = o.order_id
GROUP BY
    m.order_id, o.city_code;





USE ironhack_delivery;
SELECT * FROM customer_courier_conversations
LIMIT 5;
