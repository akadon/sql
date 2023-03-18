CREATE TABLE bugseverity (
  serverity_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  serverity_name VARCHAR(255)  NULL  ,
  description TEXT  NULL    ,
PRIMARY KEY(serverity_id))
TYPE=InnoDB;


CREATE TABLE bugpriority (
  priority_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  priority_name VARCHAR(255)  NULL    ,
PRIMARY KEY(priority_id))
TYPE=InnoDB;


CREATE TABLE bug_status (
  status_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  status_name VARCHAR(255)  NULL    ,
PRIMARY KEY(status_id))
TYPE=InnoDB;


CREATE TABLE produkt (
  idprodukt INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  account_id INTEGER UNSIGNED  NULL  ,
  product_name VARCHAR(255))  NULL  ,
  description TEXT  NULL    ,
PRIMARY KEY(idprodukt))
TYPE=InnoDB;


CREATE TABLE account_role (
  role_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  role_name VARCHAR(255)  NULL    ,
PRIMARY KEY(role_id));


CREATE TABLE tag (
  tag_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  tag VARCHAR(255)  NULL  ,
  description TEXT  NULL    ,
PRIMARY KEY(tag_id))
TYPE=InnoDB;


CREATE TABLE account_type (
  type_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  account_id INTEGER UNSIGNED  NULL  ,
  type_name VARCHAR(255)  NULL  ,
  description TEXT  NULL    ,
PRIMARY KEY(type_id))
TYPE=InnoDB;


CREATE TABLE account (
  type_id INTEGER UNSIGNED  NOT NULL  ,
  role_id INTEGER UNSIGNED  NOT NULL  ,
  account_name VARCHAR(255)  NULL  ,
  first_name VARCHAR(255)  NULL  ,
  last_name VARCHAR(255)  NULL  ,
  email VARCHAR(255)  NULL  ,
  password_hash CHAR(64)  NULL  ,
  portrait_image BLOB  NULL  ,
  hourly_rate NUMERIC(9,2)  NULL  ,
  account_tyoe VARCHAR  NULL  ,
  account_role VARCHAR  NULL    ,
PRIMARY KEY(type_id, role_id),
  FOREIGN KEY(type_id)
    REFERENCES account_type(type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(role_id)
    REFERENCES account_role(role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE bug (
  bug_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  priority_id INTEGER UNSIGNED  NOT NULL  ,
  serverity_id INTEGER UNSIGNED  NOT NULL  ,
  status_id INTEGER UNSIGNED  NOT NULL  ,
  account_role_id INTEGER UNSIGNED  NOT NULL  ,
  summary VARCHAR(1000)  NULL  ,
  Description VARCHAR(1000)  NULL  ,
  resolution VARCHAR(1000)  NULL  ,
  hours INTEGER UNSIGNED  NULL  ,
  date_reported DATE  NULL    ,
PRIMARY KEY(bug_id, priority_id, serverity_id, status_id, account_role_id),
  FOREIGN KEY(status_id)
    REFERENCES bug_status(status_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(serverity_id)
    REFERENCES bugseverity(serverity_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_role_id, account_type_id)
    REFERENCES account(role_id, type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_role_id, account_type_id)
    REFERENCES account(role_id, type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_role_id, account_type_id)
    REFERENCES account(role_id, type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(priority_id)
    REFERENCES bugpriority(priority_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE screenshot (
  bug_status_id INTEGER UNSIGNED  NOT NULL  ,
  bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  bug_id INTEGER UNSIGNED  NOT NULL  ,
  screenshot_image BLOB  NULL  ,
  caption VARCHAR(255)  NULL    ,
PRIMARY KEY(bug_status_id, bug_serverity_id, bug_priority_id, bug_id),
  FOREIGN KEY(bug_id, bug_priority_id, bug_serverity_id, bug_status_id, bug_account_role_id)
    REFERENCES bug(bug_id, priority_id, serverity_id, status_id, account_role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE comment  (
  bug_status_id INTEGER UNSIGNED  NOT NULL  ,
  bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  bug_id INTEGER UNSIGNED  NOT NULL  ,
  author INTEGER UNSIGNED  NULL  ,
  comment_date DATE  NULL  ,
  content TEXT  NULL    ,
PRIMARY KEY(bug_status_id, bug_serverity_id, bug_priority_id, bug_id),
  FOREIGN KEY(bug_id, bug_priority_id, bug_serverity_id, bug_status_id, bug_account_role_id)
    REFERENCES bug(bug_id, priority_id, serverity_id, status_id, account_role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE comment _has_comment  (
  comment _bug_id INTEGER UNSIGNED  NOT NULL  ,
  comment _bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  comment _bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  comment _bug_status_id INTEGER UNSIGNED  NOT NULL  ,
  ancestor INTEGER UNSIGNED  NULL  ,
  descendant INTEGER UNSIGNED  NULL  ,
  depth INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(comment _bug_id, comment _bug_priority_id, comment _bug_serverity_id, comment _bug_status_id),
  FOREIGN KEY(comment _bug_status_id, comment _bug_serverity_id, comment _bug_priority_id, comment _bug_id)
    REFERENCES comment (bug_status_id, bug_serverity_id, bug_priority_id, bug_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(comment _bug_status_id, comment _bug_serverity_id, comment _bug_priority_id, comment _bug_id)
    REFERENCES comment (bug_status_id, bug_serverity_id, bug_priority_id, bug_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE product_account (
  product_id INTEGER UNSIGNED  NOT NULL  ,
  account_role_id INTEGER UNSIGNED  NOT NULL  ,
  account_id INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(product_id, account_role_id),
  FOREIGN KEY(product_id)
    REFERENCES produkt(idprodukt)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_role_id, account_type_id)
    REFERENCES account(role_id, type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE bug_historie (
  bug_history_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  bug_status_id INTEGER UNSIGNED  NOT NULL  ,
  bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  bug_id INTEGER UNSIGNED  NOT NULL  ,
  account_role_id INTEGER UNSIGNED  NOT NULL  ,
  changed_by INTEGER UNSIGNED  NULL  ,
  date_reported: DATE  NULL  ,
  summary TEXT  NULL  ,
  description TEXT  NULL  ,
  resolution TEXT  NULL  ,
  priority INTEGER UNSIGNED  NULL  ,
  hours NUMERIC(9,2)  NULL  ,
  date_changed DATE  NULL  ,
  change_action VARCHAR(255))  NULL    ,
PRIMARY KEY(bug_history_id, bug_status_id, bug_serverity_id, bug_priority_id, bug_id, account_role_id),
  FOREIGN KEY(bug_id, bug_priority_id, bug_serverity_id, bug_status_id, bug_account_role_id)
    REFERENCES bug(bug_id, priority_id, serverity_id, status_id, account_role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_role_id, account_type_id)
    REFERENCES account(role_id, type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE bug_tag (
  tag_id INTEGER UNSIGNED  NOT NULL  ,
  bug_status_id INTEGER UNSIGNED  NOT NULL  ,
  bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  bug_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(tag_id, bug_status_id, bug_serverity_id, bug_priority_id, bug_id),
  FOREIGN KEY(tag_id)
    REFERENCES tag(tag_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(bug_id, bug_priority_id, bug_serverity_id, bug_status_id, bug_account_role_id)
    REFERENCES bug(bug_id, priority_id, serverity_id, status_id, account_role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


CREATE TABLE bug_produkt (
  bug_id INTEGER UNSIGNED  NOT NULL  ,
  account_id INTEGER UNSIGNED  NOT NULL  ,
  bug_priority_id INTEGER UNSIGNED  NOT NULL  ,
  bug_serverity_id INTEGER UNSIGNED  NOT NULL  ,
  bug_status_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(bug_id, account_id, bug_priority_id, bug_serverity_id, bug_status_id),
  FOREIGN KEY(bug_id, bug_priority_id, bug_serverity_id, bug_status_id, bug_account_role_id)
    REFERENCES bug(bug_id, priority_id, serverity_id, status_id, account_role_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(account_id)
    REFERENCES produkt(idprodukt)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;


