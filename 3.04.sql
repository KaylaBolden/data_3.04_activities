-- 3.04.4
-- Top 10 loans vs. top 10% loans in the loan table from the bank database .

select * from bank.loan
order by amount desc
limit 10;

select * from(
select *, ROW_NUMBER() OVER (ORDER BY amount desc)
                    AS rowNumber from bank.loan)s1
where rowNumber <=(select count(*)*.1 from bank.loan)
;

