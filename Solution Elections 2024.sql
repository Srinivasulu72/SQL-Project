-- 1.Total Lok sabha seats :
select count(Parliament_Constituency) as total_seats from constituencywise_results;

-- 2.What is the total number of seats available for elections in each state

select s.state as state_name
,count(cr.Constituency_ID) as Constitutency from constituencywise_results cr
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
join states s on s.State_ID = sr.State_ID
group by s.State
order by s.state;

-- 3. Total seats won by NDA Alliances.

SELECT 
    SUM(CASE 
            WHEN party IN (
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
            ) THEN won
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;
    

-- 4. Seats Won by NDA Allianz Parties

select Party as Party_name,won as seats from partywise_results
where Party in ('Bharatiya Janata Party - BJP', 
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
order by won desc;

-- 5.Total Seats Won by I.N.D.I.A. Allianz

SELECT 
    SUM(CASE 
            WHEN party IN (
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
            ) THEN won
            ELSE 0 
        END) AS India_Alliance_Total_Seats_Won
FROM 
    partywise_results;
    
-- 6. Seats Won by I.N.D.I.A. Allianz Parties 
   
select Party as party_name,
won as No_of_seats from partywise_results
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
)
order by won desc;	

-- 7. Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add party_alliance varchar(50);

update partywise_results
set party_alliance ="india"
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
);

update partywise_results
set party_alliance ="NDA"
where party in 
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
);

update partywise_results
set party_alliance = "other"
where party_alliance is null;

select * from partywise_results;

-- 8.Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'india', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;
    
-- 9.Winning candidate's name, their party name, total votes, 
-- and the margin of victory for a specific state and constituency?    


select 
cr.Winning_Candidate,
pr.Party,
cr.Total_Votes,
cr.Margin,
cr.Constituency_Name,
sr.State
 from constituencywise_results cr
join partywise_results pr on pr.Party_ID= cr.Party_ID
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency;

SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin,
 cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID;

-- 10.What is the distribution of EVM votes
--  versus postal votes for candidates in a specific constituency?

select cd.Candidate,cd.EVM_Votes,cd.Postal_Votes,cd.Total_Votes,
cr.Constituency_Name,cd.Party
 from constituencywise_details cd
join constituencywise_results cr on cr.Constituency_ID = cd.Constituency_ID
where cr.Constituency_Name ="vijayawada";

-- 11.Which parties won the most seats in a State, and how many seats did each party win?

select pr.Party,count(cr.Constituency_ID) as Won_seats from constituencywise_results cr
join partywise_results pr on pr.Party_ID = cr.Party_ID
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
join states s on s.State_ID = sr.State_ID
where s.state ="uttar Pradesh"
group by pr.Party;

-- 12. What is the total number of seats won by each party 
-- alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'India' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
GROUP BY 
    s.State
ORDER BY 
    s.State;
    
-- 13. Which candidate received the highest number of EVM votes in each constituency (Top 10)?

select cd.Candidate, cd.EVM_Votes,cr.Constituency_Name from constituencywise_details cd
join
     constituencywise_results cr on cr.Constituency_ID = cd.Constituency_ID
order by EVM_Votes desc
limit 10;



-- 14. Which candidate won and which candidate was the
-- runner-up in each constituency of State for the 2024 elections?


 with vote as (
 select 
 cd.Constituency_ID,
 cd.Candidate,
 cd.EVM_Votes,
 cd.Postal_Votes,
 (cd.EVM_Votes+cd.Postal_Votes) as total_votes,
 row_number() over(partition by Constituency_ID order by cd.EVM_Votes+cd.Postal_Votes desc) as rank_vote
 from constituencywise_details cd
 JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'andhra pradesh'
)

select  cr.Constituency_Name,
MAX(case when v.rank_vote = 1 then v.candidate end) as Winning_candidate,
MAX(case when v.rank_vote = 2 then v.candidate end) as Winning_candidate
 from vote v
 join
	 constituencywise_results cr on cr.Constituency_ID = v.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;







