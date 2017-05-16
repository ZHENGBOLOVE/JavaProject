


--����Ա��
create table admin(
       --����Ա�ʺ�
       aname varchar2(20) primary key not null,
       --����
       apassword varchar2(20) not null,
       --Ȩ��
       atype number(1) check (atype in (0,1))
);

--����
create table invent(
       --���
       inventid number primary key,
       --��Ʒ���
       goodsid number references goods(goodsid) not null,
       --����
       gcount number not null
);

--��Ʒ��
create table goods(
       --��Ʒ���
       goodsid number primary key,
       --��Ʒ����
       gname varchar2(50) not null,
       --��Ʒ����
       gtno number references goodstype(gtno) not null,
       --ͼƬ
       gpic varchar2(100) ,
       --Ʒ��
       brand varchar2(100),
       --�ͺ�
       xinghao varchar2(100)
);

--��Ʒ���ͱ�
create table goodstype(
       --���ͱ��
       gtno number primary key,
       --��������
       gtname varchar2(20)
);

--�����ϸ��
create table inbound(
       --�����ϸ����
       ibid number primary key,
       --��ⶩ�����
       ioid number references inorder(ioid),
       --��������
       goodsid number references goods(goodsid),
       --����
       num number
);

--������ϸ��
create table outbound(
       --������ϸ����
       obid number primary key,
       --���ⶩ�����
       ooid number references outorder(ooid),
       --������Ʒ���
       goodsid number references goods(goodsid),
       --��������
       num number
);

--���ⶩ����
create table outorder(
       --���ⶩ�����
       ooid number primary key,
       --��������
       odate varchar2(100) not null,
       --�������Ա
       empno number references empor(empno),
       --������
       aname varchar2(20) references admin(aname)
);

--��ⶩ����
create table inorder(
       --��ⶩ�����
       ioid number primary key,
       --�������
       idate varchar2(100) not null,
       --������Ա
       empno number references empor(empno),
       --�����
       aname varchar2(20) references admin(aname),
       --��Ӧ��
       cname number references company(cid)
);

--��Ӧ�̱�
create table company(
	   --��Ӧ��id
	   cid number primary key,
       --��Ӧ�̹�˾��
       cname varchar2(100),
       --��ϵ�绰
       tel varchar2(20),
       --����
       email varchar2(50),
       --��ϵ��
       person varchar2(20) not null,
       --��ַ
       address varchar2(100)
);

--Ա����
create table empor(
       --Ա�����
       empno number primary key,
       --Ա������
       empname varchar2(20) not null
);
