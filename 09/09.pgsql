--1) Geben Sie die Namen und Vornamen aller Besucher an, die an der Dorfstrasse wohnen.

SELECT vorname, name
FROM besucher
WHERE upper(strasse) = 'DORFSTRASSE';

--2) Geben Sie die Namen aller Personen an, deren Lieblingsbier ‚Malzdrink‘ ist und die dieses besser als mit 3 bewerten.
SELECT bname, bvorname
FROM lieblingsbier lb
WHERE bsorte = 'Malzdrink';

--3) Sortieren Sie das Ergebnis aus Aufgabe 1) absteigend nach Name und Vorname
SELECT vorname, name
FROM besucher
WHERE upper(strasse) = 'DORFSTRASSE'
ORDER BY name, vorname asc;

--4) Geben Sie den Suppenpreis und den Restaurantnamen aller Restaurants an, die Biere mit dem Grundstoff ‚Hopfen‘ anbieten
SELECT r.suppenpreis, r.name
FROM restaurant r
JOIN sortiment s on s.rname = r.name
JOIN biersorte b on b.name = s.bsorte
WHERE b.grundstoff = 'Hopfen';

--5) Geben Sie Namen und Geburtstag aller Gäste an, die ein Restaurant mit Eröffnungsdatum vor dem Jahr 2010 besuchen.
SELECT DISTINCT(b.name), b.vorname, b.gebtag
FROM besucher b 
JOIN gast g on b.name = g.bname AND b.vorname = g.bvorname
JOIN restaurant r on r.name = g.rname
WHERE r.eroeffnungsdatum > to_date('YYYY', '2010');

--6) Formulieren Sie den Ausdruck: 𝜋𝑁𝑎𝑚𝑒,𝑉𝑜𝑟𝑛𝑎𝑚𝑒(𝐵𝑒𝑠𝑢𝑐ℎ𝑒𝑟) \ 𝜋𝐵𝑛𝑎𝑚𝑒,𝐵𝑣𝑜𝑟𝑛𝑎𝑚𝑒(𝐺𝑎𝑠𝑡) ⊔ 𝜋𝐵𝑛𝑎𝑚𝑒,𝐵𝑣𝑜𝑟𝑛𝑎𝑚𝑒 (𝐿𝑖𝑒𝑏𝑙𝑖𝑛𝑔𝑠𝑏𝑖𝑒𝑟)) in SQL. Hier identifizieren wir Name mit Bname, etc.; es soll angenommen werden, dass das Datenbanksystem EXCEPT nicht kennt. Formulieren Sie den Ausdruck auch in Prosa.
--PROSA: Alle Besucher, welche kein Gast sind oder kein lieblingsbier haben oder beides. 
SELECT b.name, b.vorname, g.bname as gastname, l.bsorte as biersorte
FROM besucher b 
LEFT OUTER JOIN gast g on g.bname = b.name AND g.bvorname = b.vorname
LEFT OUTER JOIN lieblingsbier l on l.bname = b.name AND l.bvorname = b.vorname
WHERE g.bname IS NULL OR l.bsorte IS NULL;

