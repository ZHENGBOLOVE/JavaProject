


--管理员表
create table admin(
       --管理员帐号
       aname varchar2(20) primary key not null,
       --密码
       apassword varchar2(20) not null,
       --权限
       atype number(1) check (atype in (0,1))
);

--库存表
create table invent(
       --编号
       inventid number primary key,
       --货品编号
       goodsid number references goods(goodsid) not null,
       --数量
       gcount number not null
);

--货品表
create table goods(
       --货品编号
       goodsid number primary key,
       --货品名称
       gname varchar2(50) not null,
       --货品类型
       gtno number references goodstype(gtno) not null,
       --图片
       gpic varchar2(100) ,
       --品牌
       brand varchar2(100),
       --型号
       xinghao varchar2(100)
);

--货品类型表
create table goodstype(
       --类型编号
       gtno number primary key,
       --类型名称
       gtname varchar2(20)
);

--入库明细表
create table inbound(
       --入库明细表编号
       ibid number primary key,
       --入库订单编号
       ioid number references inorder(ioid),
       --入库货物编号
       goodsid number references goods(goodsid),
       --数量
       num number
);

--出库明细表
create table outbound(
       --出库明细表编号
       obid number primary key,
       --出库订单编号
       ooid number references outorder(ooid),
       --出库物品编号
       goodsid number references goods(goodsid),
       --出库数量
       num number
);

--出库订单表
create table outorder(
       --出库订单编号
       ooid number primary key,
       --出库日期
       odate varchar2(100) not null,
       --出库管理员
       empno number references empor(empno),
       --出库人
       aname varchar2(20) references admin(aname)
);

--入库订单表
create table inorder(
       --入库订单编号
       ioid number primary key,
       --入库日期
       idate varchar2(100) not null,
       --入库管理员
       empno number references empor(empno),
       --入库人
       aname varchar2(20) references admin(aname),
       --供应商
       cname number references company(cid)
);

--供应商表
create table company(
	   --供应商id
	   cid number primary key,
       --供应商公司名
       cname varchar2(100),
       --联系电话
       tel varchar2(20),
       --邮箱
       email varchar2(50),
       --联系人
       person varchar2(20) not null,
       --地址
       address varchar2(100)
);

--员工表
create table empor(
       --员工编号
       empno number primary key,
       --员工姓名
       empname varchar2(20) not null
);
