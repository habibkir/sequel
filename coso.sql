create view ordCost(oin, totCost) as
select oin, sum(cost*number)
from order o, product p
where o.product = p.pin
group by oin;

select avg(totCost)
from ordCost;

-- Testato, la cosa (circa) funziona
-- Posgres non mi ha ucciso per la seguente

select sum(stipendio +  budget)
from impiegato join progetto
on matricola = responsabile ;
