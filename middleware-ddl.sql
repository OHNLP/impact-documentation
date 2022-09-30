create table if not exists AUDIT_LOG
(
    row_uid       bigint auto_increment
        primary key,
    project_uid   varchar(255) not null,
    job_uid       varchar(255) not null,
    criterion_uid bigint       not null,
    user_uid      varchar(255) not null,
    start_dtm     datetime     not null,
    end_dtm       datetime     null,
    job_status    int          not null,
    archived      tinyint(1)   null,
    constraint AUDIT_LOG_row_uid_uindex
        unique (row_uid)
);

create index AUDIT_LOG_job_uid_index
    on AUDIT_LOG (job_uid);

create index AUDIT_LOG_project_uid_index
    on AUDIT_LOG (project_uid);

create table if not exists COHORT
(
    row_uid    bigint auto_increment
        primary key,
    job_uid    varchar(255) not null,
    person_uid varchar(255) not null,
    score      double       not null,
    constraint COHORT_row_uid_uindex
        unique (row_uid)
);

create index COHORT_job_uid_index
    on COHORT (job_uid);

create table if not exists COHORT_RELEVANCE
(
    row_uid        bigint auto_increment
        primary key,
    cohort_row_uid bigint       not null,
    judger_uid     varchar(255) not null,
    judgement      varchar(255) null,
    constraint COHORT_RELEVANCE_row_uid_uindex
        unique (row_uid)
);

create index COHORT_RELEVANCE_cohort_row_uid_judger_uid_index
    on COHORT_RELEVANCE (cohort_row_uid, judger_uid);

create index COHORT_RELEVANCE_judger_uid_index
    on COHORT_RELEVANCE (judger_uid);

create table if not exists EVIDENCE
(
    row_uid      bigint auto_increment
        primary key,
    job_uid      varchar(255) not null,
    node_uid     varchar(255) not null,
    person_uid   varchar(255) not null,
    evidence_uid varchar(255) not null,
    constraint EVIDENCE_row_uid_uindex
        unique (row_uid)
);

create index EVIDENCE_job_uid_node_uid_index
    on EVIDENCE (job_uid, node_uid);

create table if not exists EVIDENCE_RELEVANCE
(
    row_uid          bigint auto_increment
        primary key,
    evidence_row_uid bigint       not null,
    judger_uid       varchar(255) not null,
    judgement        varchar(255) not null,
    constraint EVIDENCE_RELEVANCE_row_uid_uindex
        unique (row_uid)
);

create index EVIDENCE_RELEVANCE_evidence_row_uid_index
    on EVIDENCE_RELEVANCE (evidence_row_uid);

create index EVIDENCE_RELEVANCE_judger_uid_index
    on EVIDENCE_RELEVANCE (judger_uid);

create table if not exists NODE_RELEVANCE
(
    row_uid      bigint auto_increment
        primary key,
    job_uid      varchar(255) not null,
    node_uid     varchar(255) not null,
    person_uid   varchar(255) not null,
    judger_uid   varchar(255) not null,
    judgement    varchar(255) null,
    user_comment longtext     null,
    constraint NODE_RELEVANCE_row_uid_uindex
        unique (row_uid)
);

create index NODE_RELEVANCE_job_uid_node_uid_person_uid_index
    on NODE_RELEVANCE (job_uid, node_uid, person_uid);

create table if not exists PROJECTS
(
    project_uid  varchar(255) not null
        primary key,
    project_name varchar(255) not null,
    constraint projects_project_uid_uindex
        unique (project_uid)
);

create table if not exists PROJECT_ARCHIVE
(
    row_uid     bigint auto_increment
        primary key,
    project_uid varchar(255) not null,
    constraint PROJECT_ARCHIVE_row_uid_uindex
        unique (row_uid)
);

create index PROJECT_ARCHIVE_project_uid_index
    on PROJECT_ARCHIVE (project_uid);

create table if not exists PROJECT_CRITERION
(
    row_uid       bigint auto_increment
        primary key,
    project_uid   varchar(255) not null,
    criterion     longtext     not null,
    revision_date datetime     not null,
    constraint PROJECT_CRITERION_row_uid_uindex
        unique (row_uid)
);

create index PROJECT_CRITERION_project_uid_index
    on PROJECT_CRITERION (project_uid);

create table if not exists PROJECT_ROLE_GRANTS
(
    row_uid     bigint auto_increment
        primary key,
    project_uid varchar(255) not null,
    user_uid    varchar(255) not null,
    grant_type  varchar(255) not null,
    constraint PROJECT_ROLE_GRANTS_row_uid_uindex
        unique (row_uid)
);

create index PROJECT_ROLE_GRANTS_project_uid_index
    on PROJECT_ROLE_GRANTS (project_uid);

create index PROJECT_ROLE_GRANTS_user_uid_grant_type_index
    on PROJECT_ROLE_GRANTS (user_uid, grant_type);

create index PROJECT_ROLE_GRANTS_user_uid_index
    on PROJECT_ROLE_GRANTS (user_uid);

