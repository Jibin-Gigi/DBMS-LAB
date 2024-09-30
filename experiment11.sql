grant select on Bank to c22csa36;
revoke select on Bank from c22csa36;

select * from c22csa36.bank;
update c22csa36.bank set bankname='SIB' where bankid=104;
commit;
