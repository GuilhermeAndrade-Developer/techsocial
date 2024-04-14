INSERT INTO users (date_created, date_modified, created_by, modified_by, first_name, last_name, document, email, password, phone_number, birth_date)
VALUES (
    NOW(), -- date_created
    NOW(), -- date_modified
    1,     -- created_by
    1,     -- modified_by
    'Administrador', -- first_name
    'TechSocial',     -- last_name
    NULL,             -- document
    'administrador@techsocial.com.br', -- email
    'techsocial',     -- password
    NULL,             -- phone_number
    CURDATE()         -- birth_date
);
