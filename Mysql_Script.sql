CREATE TABLE STAFF(
    staff_id VARCHAR(5),
    name VARCHAR(10),
    PRIMARY KEY(staff_id)
);

CREATE TABLE MANAGER(
    manager_id VARCHAR(5),
    name VARCHAR(10),
    field VARCHAR(10),
    PRIMARY KEY(manager_id),
    FOREIGN KEY(manager_id) REFERENCES
        STAFF(staff_id) 
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);

CREATE TABLE RESTAURANT(
	rid VARCHAR(5),
    location VARCHAR(20),
    review VARCHAR(20),
    PRIMARY KEY(rid)
);

CREATE TABLE RESTAURANT_STAFF(
	rsid VARCHAR(5),
    rid VARCHAR(5) NOT NULL,
    name VARCHAR(10),
    PRIMARY KEY(rsid),
    FOREIGN KEY(rid) REFERENCES
        RESTAURANT(rid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    
);

CREATE TABLE CUSTOMER(
    cid VARCHAR(5),
    name VARCHAR(10),
    PRIMARY KEY(cid)
);

CREATE TABLE STORE_STAFF(
    store_staff_id VARCHAR(5),
    name VARCHAR(10),
    PRIMARY KEY(store_staff_id)
);

CREATE TABLE normal_staff(
	normal_staff_id VARCHAR(5),
    sid VARCHAR(5) NOT NULL,
    name VARCHAR(10),
    PRIMARY KEY(normal_staff_id),
    FOREIGN KEY(normal_staff_id) REFERENCES
        store_staff(store_staff_id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    ,
    FOREIGN KEY(sid) REFERENCES
     	store(sid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    
);

CREATE TABLE PRINCIPAL(
	psid VARCHAR(5),
    name VARCHAR(10),
    sid VARCHAR(5) NOT NULL,
    PRIMARY KEY(psid),
    FOREIGN KEY(psid) REFERENCES
        store_staff(store_staff_id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    ,
    FOREIGN KEY(sid) REFERENCES
        store(sid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE SALES_MANAGER(
    smid VARCHAR(5),
    name VARCHAR(10),
    PRIMARY KEY(smid),
    FOREIGN KEY(smid) REFERENCES
        STORE_STAFF(store_staff_id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE STORE(
    sid VARCHAR(5),
    name VARCHAR(10),
    did VARCHAR(5) NOT NULL,
    PRIMARY KEY(SID),
    FOREIGN KEY(did) REFERENCES
        DEPART_INFO(did)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE GOODS(
    gid VARCHAR(5),
    price FLOAT,
    type VARCHAR(10),
    name VARCHAR(10),
    sid VARCHAR(5),
    PRIMARY KEY(sid, gid),
    FOREIGN KEY(sid) REFERENCES
        store(sid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CONTAIN_RESTAURANT(
	rid VARCHAR(5),
    did VARCHAR(5),
    PRIMARY KEY(rid, did),
    FOREIGN KEY(rid) REFERENCES
        restaurant(rid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    ,
    FOREIGN KEY(did) REFERENCES
        DEPART_INFO(did)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE TRANSACTION_INFO (
    sid VARCHAR(5),
    gid VARCHAR(5),
    cid VARCHAR(5),
    date CHAR(20),
    smid CHAR(5) NOT NULL,
    PRIMARY KEY (sid, gid, cid),
    FOREIGN KEY(sid,gid) REFERENCES
        GOODS(sid,gid)
        ON DELETE NO ACTION
      	ON UPDATE CASCADE
    ,
    FOREIGN KEY(sid) REFERENCES
        STORE(sid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    ,
    FOREIGN KEY(smid) REFERENCES
        STORE_STAFF(store_staff_id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
    ,
    FOREIGN KEY(cid) REFERENCES
        CUSTOMER(cid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE WORKER_JOB(
	job VARCHAR(10),
    dept VARCHAR(5),
    PRIMARY KEY(job),
    FOREIGN KEY(dept) REFERENCES
        DEPART_INFO(did)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE WOKER_INFO(
    worker_id VARCHAR(5),
	job VARCHAR(10),
    name VARCHAR(10),
    PRIMARY KEY(worker_id),
    FOREIGN KEY(job) REFERENCES
        WORKER_JOB(job)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE MANAGER_LOC(
    location VARCHAR(30),
    manager_id VARCHAR(5),
    PRIMARY KEY(location),
    FOREIGN KEY(manager_id) REFERENCES 
        MANAGER(manager_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    
);

CREATE TABLE DEPART_INFO(
    location VARCHAR(30),
    did VARCHAR(5),
    PRIMARY KEY(did),
    FOREIGN KEY(location) REFERENCES
        MANAGER_LOC(location)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE TRANSACTION_SHIPPING_INFO (
    shipping_addr VARCHAR(30),
    cid VARCHAR(5),
    PRIMARY KEY(cid),
    FOREIGN KEY(cid) REFERENCES
        customer(cid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
