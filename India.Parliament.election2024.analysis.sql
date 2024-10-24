
-- Q.1 Finding total number of seats in parliament
select distinct count(constituency_id) as total_seats
from constituencywise_results; 


-- Q.2 Find total number of seats in each state?
select count(cr.parliament_constituency) as total_seats,s.state as state_name
from states s 
inner join statewise_results sr on s.state_id=sr.state_id
inner join constituencywise_results cr on sr.parliament_constituency=cr.parliament_constituency
group by s.state;




-- Q.3 Find totals no of seats won by NDA Alliance 
select 
sum(case when party in
('Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
) then [won]
else 0
end) as total_seats_won_by_nda
from
partywise_results





-- Q.4 Find no of seats won by each party in NDA alliance
select party ,won as seats_won
from partywise_results
where party in(
'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (United) - JD(U)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
)
order by seats_won desc





--Q.5 Find total seats of  I.N.D.I.A alliance
select 
sum(
case when party in (
'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'

) then [won]
else 0
end) as total_seats
from partywise_results 






-- Q.6  Find seats won  by each party of I.N.D.I.A 
select party,won as total_seats_won
from partywise_results
where party in (
'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
) order by total_seats_won desc



--Q.7 add a column
alter table partywise_results
add party_alliance varchar(100)



--update party alliance  (I.N.D.I.A)
update partywise_results
set party_alliance='I.N.D.I.A'
where party in (
'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
)



--update party alliance  (NDA)
update partywise_results
set party_alliance='NDA'
where party in (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'

);



update partywise_results
set party_alliance='others'
where party_alliance is null;



--Q.8 Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

select pr.party_alliance, count(cr.parliament_constituency) as seats_won from 
partywise_results pr
inner join constituencywise_results  cr on  cr.party_id=pr.party_id
where party_alliance in ('NDA','others','I.N.D.I.A')
group by pr.party_alliance
order by seats_won desc;


--Q.9  Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
SELECT 
    cr.winning_candidate,
    cr.margin,
    cr.total_votes,
    cr.constituency_name,
    s.state,
    pr.party ,
	pr.party_alliance
FROM 
    partywise_results pr
INNER JOIN 
    constituencywise_results cr ON pr.party_id = cr.party_id
INNER JOIN 
    statewise_results sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN 
	states s ON sr.State_ID = s.State_ID

WHERE 
    s.state = 'bihar' 
    AND cr.parliament_constituency = 'gaya(38)';





--Q.10 What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select 
  cd.evm_votes,
  cd.postal_votes,
  cd.total_votes,
  cr.constituency_name
from 
 constituencywise_details cd
inner join 
 constituencywise_results cr on cr.constituency_id=cd.constituency_id
where cr.constituency_name ='agra'

order by total_votes desc;





--Q.11 Which parties won the most seats in s State, and how many seats did each party win?
select 
 pr.party,
 pr.party_id,
 sr.state,
 count(cr.parliament_constituency) as seats_won
from partywise_results pr
inner join constituencywise_results cr on pr.party_id=cr.party_id
inner join statewise_results sr on sr.parliament_constituency=cr.parliament_constituency

where sr.state='Andhra Pradesh'
group by pr.party, sr.state,pr.party_id
order by seats_won;






--Q.12 What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
SELECT 
    SUM(CASE WHEN party_alliance = 'NDA' THEN 1 ELSE 0 END) AS total_seats_won_NDA,
    SUM(CASE WHEN party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS total_seats_won_I_N_D_I_A,
    SUM(CASE WHEN party_alliance = 'others' THEN 1 ELSE 0 END) AS total_seats_won_others,
    sr.state
FROM 
    partywise_results pr
INNER JOIN 
    constituencywise_results cr ON pr.party_id = cr.party_id
INNER JOIN 
    statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
WHERE 
    party_alliance IN ('NDA', 'I.N.D.I.A', 'others')
GROUP BY  
    sr.state;




--Q. 13 Which parties won the most seats in s State, and how many seats did each party win?
select 
 pr.party,
 pr.party_id,
 sr.state,
 count(cr.parliament_constituency) as seats_won
from partywise_results pr
inner join constituencywise_results cr on pr.party_id=cr.party_id
inner join statewise_results sr on sr.parliament_constituency=cr.parliament_constituency
where sr.state='Andhra Pradesh'
group by pr.party, sr.state,pr.party_id
order by seats_won;






--  Q. 14For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties,
total votes (including EVM and postal), and the breakdown of EVM and postal votes?
SELECT 
    SUM(cd.evm_votes) AS total_evm_votes,
    COUNT(DISTINCT cd.Constituency_ID) AS total_seats,
    SUM(cd.total_votes) AS total_votes,
    COUNT(DISTINCT cd.candidate) AS total_candidates,
    COUNT(DISTINCT pr.party) AS total_parties
	
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID
WHERE 
    s.State = 'Maharashtra';




--Q.15 Which candidate received the highest number of EVM votes in each constituency (Top 10)?
select top 10
cd.evm_votes  ,
cr.constituency_name,
cr.constituency_id,
cd.candidate,
cd.party
from
constituencywise_results cr
inner join constituencywise_details cd on cd.Constituency_ID=cr.constituency_id
where cd.EVM_Votes =(select
max(cd1.evm_votes) from constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
		
)
ORDER BY 
    cd.EVM_Votes DESC;

