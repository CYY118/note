-- 创建学生表
CREATE TABLE student ( id INT auto_increment PRIMARY KEY COMMENT '主键ID', NAME VARCHAR ( 10 ) COMMENT '姓名', NO VARCHAR ( 10 ) COMMENT '学号' ) COMMENT '学生表';-- 插入学生信息
INSERT INTO student
VALUES
	( NULL, '张三', '2000100101' ),
	( NULL, '王五', '2000100102' ),
	( NULL, '李四', '2000100103' ),
	( NULL, '谢逊', '2000100104' );-- 创建课程表
CREATE TABLE course ( id INT auto_increment PRIMARY KEY COMMENT '主键', NAME VARCHAR ( 10 ) COMMENT '课程名称' ) COMMENT '课程表';-- 插入课程信息
INSERT INTO course
VALUES
	( NULL, 'Java' ),
	( NULL, 'PHP' ),
	( NULL, 'MySQL' ),
	( NULL, 'Hadoop' );-- 创建中间表
CREATE TABLE student_course (
	id INT auto_increment PRIMARY KEY COMMENT '主键',
	studentid INT NOT NULL COMMENT '学生ID',
	courseid INT NOT NULL COMMENT '课程ID',
	CONSTRAINT fk_courseid FOREIGN KEY ( courseid ) REFERENCES course ( id ),
	CONSTRAINT fk_studentid FOREIGN KEY ( studentid ) REFERENCES student ( id ) 
) COMMENT '学生课程中间表';-- 插入中间表信息
INSERT INTO student_course
VALUES
	( NULL, 1, 1 ),
	( NULL, 1, 2 ),
	( NULL, 1, 3 ),
	( NULL, 2, 2 ),
	( NULL, 2, 3 ),
	( NULL, 3, 4 );
CREATE TABLE tb_user (
	id INT auto_increment PRIMARY KEY COMMENT '主ID',
	NAME VARCHAR ( 10 ) COMMENT '姓名',
	age INT COMMENT '年龄',
	gender CHAR ( 1 ) COMMENT '1: 男 ，2:女',
	phone CHAR ( 11 ) COMMENT '手机号' 
) COMMENT '用户基本信息表';
CREATE TABLE tb_user_edu (
	id INT auto_increment PRIMARY KEY COMMENT '主健ID',
	degree VARCHAR ( 20 ) COMMENT '学历',
	major VARCHAR ( 50 ) COMMENT '专业',
	primaryschool VARCHAR ( 50 ) COMMENT '小学',
	middleschool VARCHAR ( 50 ) COMMENT '中学',
	university VARCHAR ( 50 ) COMMENT '大学',
	userid INT UNIQUE COMMENT '用户ID',
	CONSTRAINT fk_userid FOREIGN KEY ( userid ) REFERENCES tb_user ( id ) 
) COMMENT '用户教育信息表';
INSERT INTO tb_user ( id, NAME, age, gender, phone )
VALUES
	( NULL, '黄渤', 45, 1, '18800001111' ),
	( NULL, '冰冰', 35, 2, '18800002222' ),
	( NULL, '码云', 55, 1, '18800008888' ),
	( NULL, '李彦宏', 50, 1, '18800009999' );
INSERT INTO tb_user_edu ( id, degree, major, primaryschool, middleschool, university, userid )
VALUES
	( NULL, '本科', '舞蹈', '静安区第一小学', '静安区第一中学', '北京彝蹈学院', 1 ),
	( NULL, '顾士', '表演', '朝阳区第一小学', '朝阳区第一中学', '北京电影学院', 2 ),
	( NULL, '本科', '英语', '杭州市第一小学', '杭州市第一中学', '杭州师范大学', 3 ),
	( NULL, '本科', '应用数学', '阳泉第一小学', '阳泉区第一中学', '清华大学', 4 );-- 多表查询 ---笛卡尔积
SELECT
	* 
FROM
	emp,
	dept;-- 内连接演示
-- 表结构：emp, dept
-- 连接条件：emp.dept_id=dept.id
-- 查询每一个员工的姓名，及关联的部门的名称（隐式内连接实现）
SELECT
	emp.id,
	emp.NAME '员工姓名',
	dept.NAME '部门名称' 
FROM
	emp,
	dept 
WHERE
	emp.dept_id = dept.id;-- 查询每一个员工的姓名，及关联的部门的名称（显式内连接实现）
SELECT
	e.id,
	e.NAME '员工姓名',
	d.NAME '部门名称' 
FROM
	emp e
	INNER JOIN dept d ON e.dept_id = d.id;-- 外连接演示
-- 表结构：emp, dept
-- 连接条件：emp.dept_id=dept.id
-- 查询emp表所有数据，和对应的部门信息(左外连接)
SELECT
	e.*,
	d.NAME 
FROM
	emp e
	LEFT OUTER JOIN dept d ON e.dept_id = d.id;-- outer 可写可不写
-- 查询dept表所有数据，和对应的员工信息(右外连接)
SELECT
	d.*,
	e.* 
FROM
	emp e
	RIGHT OUTER JOIN dept d ON e.dept_id = d.id;-- outer 可写可不写
-- 注意：右外通常可以改为左外，如下
SELECT
	d.*,
	e.* 
FROM
	dept d
	LEFT OUTER JOIN emp e ON e.dept_id = d.id;-- 自连接
-- 表结构：emp,
-- 查询员工 及其 所属员工的名字
SELECT
	a.NAME '员工姓名',
	b.NAME '领导姓名' 
FROM
	emp a,
	emp b 
WHERE
	a.managerid = b.id;-- 查询所有员工 emp 及其领导的名字 emp，如果员工没有领导，也需要查询出来
SELECT
	a.NAME '员工姓名',
	b.NAME '领导姓名' 
FROM
	emp a
	LEFT JOIN emp b ON a.managerid = b.id;