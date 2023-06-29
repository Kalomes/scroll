-- +goose Up
-- +goose StatementBegin

create table session_info
(
    id                  BIGSERIAL      PRIMARY KEY,
    task_id             VARCHAR        NOT NULL,
    roller_public_key   VARCHAR        NOT NULL,
    prove_type          INTEGER        DEFAULT 0,
    roller_name         VARCHAR        NOT NULL,
    proving_status      INTEGER        DEFAULT 1,
    failure_type        INTEGER        DEFAULT 0,
    reward              BIGINT         DEFAULT 0,
    proof               BYTEA          DEFAULT NULL,
    created_at          TIMESTAMP(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP(0)   DEFAULT NULL,

    CONSTRAINT idx_session_unique UNIQUE (hash, roller_public_key)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table if exists session_info;
-- +goose StatementEnd