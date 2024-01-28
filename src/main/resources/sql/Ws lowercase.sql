-- psql -U postgres -d foot

create table region(
    regionId serial primary key,
    regionNom varchar(40),
    regionCode varchar(40)
);

create table tournoi(
    tournoiId serial primary key,
    tournoiNom varchar(40),
    tournoiNomCourt varchar(40),
    regionId integer,
    Foreign key (regionId) references Region(regionId)
);

create table equipe(
    equipeId serial primary key,
    equipeNom varchar(40),
    tournoiId integer
);

create table saison(
    saisonId serial primary key,
    saisonNom varchar(40)
);


create table equipestatsummaryhome(
    equipeId integer,
    saisonId integer,
    butHome integer,
    tirParMatchHome double precision,
    cartonJauneHome integer,
    cartonRougeHome integer,
    possessionHome double precision,
    passeReussieHome double precision,
    duelsAeriensRemportesHome double precision,
    noteSummaryHome double precision,
    Foreign key (equipeId) references Equipe(equipeId),
    Foreign key (saisonId) references Saison(saisonId)
);

create or replace view summaryhome as
select equipe.equipeNom,
        butHome,
        tirParMatchHome,
        cartonJauneHome,
        cartonRougeHome,
        possessionHome,
        passeReussieHome,
        duelsAeriensRemportesHome,
        noteSummaryHome
        from equipestatsummaryhome
        join equipe on equipe.equipeId = equipestatsummaryhome.equipeId order by noteSummaryHome DESC;

create table equipestatsummaryaway(
    equipeId integer,
    saisonId integer,
    butAway integer,
    tirParMatchAway double precision,
    cartonJauneAway integer,
    cartonRougeAway integer,
    possessionAway double precision,
    passeReussieAway double precision,
    duelsAeriensRemportesAway double precision,
    noteSummaryAway double precision,
    Foreign key (equipeId) references equipe(equipeId),
    Foreign key (saisonId) references saison(saisonId)
);

create or replace view summaryaway as
select equipe.equipeNom,
        butAway,
        tirParMatchAway,
        cartonJauneAway,
        cartonRougeAway,
        possessionAway,
        passeReussieAway,
        duelsAeriensRemportesAway,
        noteSummaryAway
        from equipestatsummaryaway
        join equipe on equipe.equipeId = equipestatsummaryaway.equipeId order by noteSummaryAway DESC;


create or replace view summaryoverall as
SELECT
    equipe.equipeNom,
    ((butHome + EquipeStatSummaryAway.butAway)/2) butSummaryOverall,
    ((tirParMatchHome + EquipeStatSummaryAway.tirParMatchAway)/2) tirParMatchSummaryOverall,
    (cartonJauneHome + EquipeStatSummaryAway.cartonJauneAway) cartonJauneSummaryOverall,
    (cartonRougeHome + EquipeStatSummaryAway.cartonRougeAway) cartonRougeSummaryOverall,
    ((possessionHome + EquipeStatSummaryAway.possessionAway)/2) possessionSummaryOverall,
    ((passeReussieHome + EquipeStatSummaryAway.passeReussieAway)/2) passeReussieSummaryOverall,
    ((duelsAeriensRemportesHome + EquipeStatSummaryAway.duelsAeriensRemportesAway)/2) duelsAeriensRemportesSummaryOverall,
    ((noteSummaryHome + EquipeStatSummaryAway.noteSummaryAway)/2) noteSummaryOverall
FROM EquipeStatSummaryHome
join equipe on equipe.equipeId = equipestatsummaryHome.equipeId 
JOIN EquipeStatSummaryAway ON EquipeStatSummaryHome.equipeId = EquipeStatSummaryAway.equipeId;

create table equipestatdefensivehome(
    equipeId integer,
    saisonId integer,
    TirConcedeParMatchHome double precision,
    TacleParMatchHome double precision,
    InterceptionParMatchHome double precision,
    FauteParMatchHome double precision,
    HorsJeuParMatchHome double precision,
    noteDefensiveHome double precision,
    Foreign key (equipeId) references Equipe(equipeId),
    Foreign key (saisonId) references Saison(saisonId)
);

create or replace view defensivehome as
SELECT
    equipe.equipeNom,
    TirConcedeParMatchHome,
    TacleParMatchHome,
    InterceptionParMatchHome,
    FauteParMatchHome,
    HorsJeuParMatchHome,
    noteDefensiveHome
FROM EquipeStatDefensiveHome
join equipe on equipe.equipeId = EquipeStatDefensiveHome.equipeId ;


create table equipestatdefensiveaway(
    equipeId integer,
    saisonId integer,
    TirConcedeParMatchAway double precision,
    TacleParMatchAway double precision,
    InterceptionParMatchAway double precision,
    FauteParMatchAway double precision,
    HorsJeuParMatchAway double precision,
    noteDefensiveAway double precision,
    Foreign key (equipeId) references Equipe(equipeId),
    Foreign key (saisonId) references Saison(saisonId)
);

create or replace view defensiveaway as
SELECT
    equipe.equipeNom,
    TirConcedeParMatchAway,
    TacleParMatchAway,
    InterceptionParMatchAway,
    FauteParMatchAway,
    HorsJeuParMatchAway,
    noteDefensiveAway
FROM EquipeStatDefensiveAway
join equipe on equipe.equipeId = EquipeStatDefensiveAway.equipeId;

create or replace view defensiveoverall as
SELECT
    equipe.equipeNom,
    ((TirConcedeParMatchHome + EquipeStatDefensiveAway.TirConcedeParMatchAway)/2) TirConcedeParMatchOverall,
    ((TacleParMatchHome + EquipeStatDefensiveAway.TacleParMatchAway)/2) TacleParMatchOverall,
    ((InterceptionParMatchHome + EquipeStatDefensiveAway.InterceptionParMatchAway)/2)InterceptionParMatchOverall,
    ((FauteParMatchHome + EquipeStatDefensiveAway.FauteParMatchAway)/2)FauteParMatchOverall,
    ((HorsJeuParMatchHome + EquipeStatDefensiveAway.HorsJeuParMatchAway)/2) HorsJeuParMatchOverall,
    ((noteDefensiveHome + EquipeStatDefensiveAway.noteDefensiveAway)/2) noteDefensiveOverall
FROM EquipeStatDefensiveHome
join equipe on equipe.equipeId = EquipeStatDefensiveHome.equipeId
JOIN EquipeStatDefensiveAway ON EquipeStatDefensiveHome.equipeId = EquipeStatDefensiveAway.equipeId;

create table equipestatoffensivehome(
    equipeId integer,
    saisonId integer,
    TirParMatchHome double precision,
    TirCadreParMatchHome double precision,
    DribbleParMatchHome double precision,
    FauteParMatchHome double precision,
    noteOffensiveHome double precision,
    Foreign key (equipeId) references Equipe(equipeId),
    Foreign key (saisonId) references Saison(saisonId)
);

create or replace view offensivehome as
SELECT
    equipe.equipeNom,
    TirParMatchHome,
    TirCadreParMatchHome,
    DribbleParMatchHome,
    FauteParMatchHome,
    noteOffensiveHome
FROM EquipeStatOffensiveHome
join equipe on equipe.equipeId = EquipeStatOffensiveHome.equipeId
JOIN EquipeStatDefensiveAway ON EquipeStatOffensiveHome.equipeId = EquipeStatDefensiveAway.equipeId;

create table equipestatoffensiveaway(
    equipeId integer,
    saisonId integer,
    TirParMatchAway double precision,
    TirCadreParMatchAway double precision,
    DribbleParMatchAway double precision,
    FauteParMatchAway double precision,
    noteOffensiveAway double precision,
    Foreign key (equipeId) references Equipe(equipeId),
    Foreign key (saisonId) references Saison(saisonId)
);

create or replace view offensiveaway as
SELECT
    equipe.equipeNom,
    TirParMatchAway,
    TirCadreParMatchAway,
    DribbleParMatchAway,
    FauteParMatchAway,
    noteOffensiveAway
FROM EquipeStatOffensiveAway
join equipe on equipe.equipeId = EquipeStatOffensiveAway.equipeId;

create or replace view offensiveoverall as
SELECT
    equipe.equipeNom,
    ((TirParMatchHome + EquipeStatOffensiveAway.TirParMatchAway)/2) TirParMatchOverall,
    ((TirCadreParMatchHome + EquipeStatOffensiveAway.TirCadreParMatchAway)/2) TirCadreParMatchOverall,
    ((DribbleParMatchHome + EquipeStatOffensiveAway.DribbleParMatchAway)/2) DribbleParMatchOverall,
    ((FauteParMatchHome + EquipeStatOffensiveAway.FauteParMatchAway)/2) FauteParMatchOverall,
    ((noteOffensiveHome + EquipeStatOffensiveAway.noteOffensiveAway)/2) noteOffensiveOverall
FROM EquipeStatOffensiveHome
join equipe on equipe.equipeId = EquipeStatOffensiveHome.equipeId
JOIN EquipeStatOffensiveAway ON EquipeStatOffensiveHome.equipeId = EquipeStatOffensiveAway.equipeId;

insert into region(regionNom, regionCode) values ('Allemagne', 'de');
insert into region(regionNom, regionCode) values ('Espagne', 'es');
insert into region(regionNom, regionCode) values ('Italie', 'it');
insert into region(regionNom, regionCode) values ('Angleterre', 'en');
insert into region(regionNom, regionCode) values ('France', 'fr');

insert into tournoi(tournoiNom, tournoiNomCourt, regionId) values ('Bundesliga', 'Bu', 1);
insert into tournoi(tournoiNom, tournoiNomCourt, regionId) values ('La Liga', 'LaL', 2);
insert into tournoi(tournoiNom, tournoiNomCourt, regionId) values ('Serie A', 'SA', 3);
insert into tournoi(tournoiNom, tournoiNomCourt, regionId) values ('Premier League', 'PL', 4);
insert into tournoi(tournoiNom, tournoiNomCourt, regionId) values ('Ligue 1', 'L1', 5);

insert into equipe(equipeNom, tournoiId) values ('Bayern Munich', 1);
insert into equipe(equipeNom, tournoiId) values ('Real Madrid', 2);
insert into equipe(equipeNom, tournoiId) values ('FC Barcelone', 2);
insert into equipe(equipeNom, tournoiId) values ('Juventus', 3);
insert into equipe(equipeNom, tournoiId) values ('Manchester City', 4);

insert into saison(saisonNom) values ('2023/2024');

insert into equipestatsummaryhome(equipeId, saisonId, butHome, tirParMatchHome, cartonJauneHome, cartonRougeHome, possessionHome, passeReussieHome, duelsAeriensRemportesHome, noteSummaryHome)
values (1, 1, 30, 15.5, 5, 1, 55.2, 89.6, 12.3, 7.8),
       (2, 1, 28, 14.2, 4, 0, 52.1, 88.5, 11.8, 7.6),
       (3, 1, 25, 13.8, 3, 1, 50.5, 87.3, 11.2, 7.4),
       (4, 1, 23, 13.0, 2, 0, 49.3, 86.7, 10.9, 7.2),
       (5, 1, 27, 14.5, 4, 1, 53.7, 88.9, 12.0, 7.7);


insert into equipestatsummaryaway(equipeId, saisonId, butAway, tirParMatchAway, cartonJauneAway, cartonRougeAway, possessionAway, passeReussieAway, duelsAeriensRemportesAway, noteSummaryAway)
values (1, 1, 12, 13.2, 3, 0, 46.8, 85.2, 11.0, 7.2),
       (2, 1, 10, 12.5, 2, 0, 45.6, 84.3, 10.5, 7.0),
       (3, 1, 15, 14.0, 3, 1, 47.3, 86.0, 11.5, 7.5),
       (4, 1, 13, 13.5, 2, 0, 48.1, 86.5, 11.8, 7.6),
       (5, 1, 11, 12.8, 3, 1, 46.5, 85.8, 11.2, 7.3);

insert into equipestatdefensivehome(equipeId, saisonId, TirConcedeParMatchHome, TacleParMatchHome, InterceptionParMatchHome, FauteParMatchHome, HorsJeuParMatchHome, noteDefensiveHome)
values (1, 1, 8.5, 18.3, 5.7, 10.2, 2.1, 7.5),
       (2, 1, 7.2, 17.5, 5.0, 9.5, 1.8, 7.2),
       (3, 1, 8.8, 19.0, 5.8, 10.8, 2.3, 7.8),
       (4, 1, 7.5, 18.7, 5.5, 10.5, 2.0, 7.6),
       (5, 1, 8.0, 18.0, 5.6, 10.0, 2.2, 7.4);


insert into equipestatdefensiveaway(equipeId, saisonId, TirConcedeParMatchAway, TacleParMatchAway, InterceptionParMatchAway, FauteParMatchAway, HorsJeuParMatchAway, noteDefensiveAway)
values (1, 1, 6.2, 16.8, 4.5, 8.3, 1.9, 7.8),
       (2, 1, 5.8, 16.0, 4.2, 8.0, 1.6, 7.4),
       (3, 1, 6.5, 17.2, 4.8, 8.5, 2.0, 7.6),
       (4, 1, 5.9, 16.5, 4.4, 8.2, 1.8, 7.5),
       (5, 1, 6.1, 16.7, 4.6, 8.4, 1.7, 7.7);


insert into equipestatoffensivehome(equipeId, saisonId, TirParMatchHome, TirCadreParMatchHome, DribbleParMatchHome, FauteParMatchHome, noteOffensiveHome)
values (1, 1, 20.1, 8.7, 11.4, 12.5, 8.1),
       (2, 1, 19.5, 8.0, 11.0, 12.0, 8.0),
       (3, 1, 20.8, 9.2, 11.8, 13.0, 8.5),
       (4, 1, 19.2, 8.5, 10.5, 11.8, 7.8),
       (5, 1, 18.7, 8.8, 10.2, 11.5, 7.6);

insert into equipestatoffensiveaway(equipeId, saisonId, TirParMatchAway, TirCadreParMatchAway, DribbleParMatchAway, FauteParMatchAway, noteOffensiveAway)
values (1, 1, 18.9, 7.3, 10.1, 11.8, 7.9),
       (2, 1, 17.8, 7.0, 9.8, 11.2, 7.5),
       (3, 1, 19.2, 7.8, 10.5, 12.2, 8.0),
       (4, 1, 18.5, 7.5, 10.2, 11.5, 7.7),
       (5, 1, 17.9, 7.2, 9.9, 11.0, 7.4);


-- create table joueur(
--     joueurId serial primary key,
--     equipeId integer,
--     saisonId integer
--     joueurNom varchar(40),
--     joueurPrenom varchar(40),
--     joueurAge integer,
--     joueurTaille double precision,
--     joueurPoids double precision,
--     joueurPoste varchar(40),
--     joueurPosteCourt varchar(40),
--     estActive BOOLEAN,
--     Foreign key (equipeId) references Equipe(equipeId),
--     Foreign key (saisonId) references Saison(saisonId)   
-- );

-- CREATE TABLE JoueurStatSummaryHome (
--     joueurId integer,
--     apparitionHome integer,
--     minutesJoueesHome integer,
--     butHome integer,
--     assistHome integer,
--     cartonJauneHome integer,
--     cartonRougeHome integer,
--     tirParMatchHome double precision,
--     passeReussieHome double precision,
--     duelsAeriensRemportesHome double precision,
--     hommeDuMatchHome integer,
--     noteHome double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );

-- CREATE TABLE JoueurStatSummaryAway (
--     joueurId integer,
--     apparitionAway integer,
--     minutesJoueesAway integer,
--     butAway integer,
--     assistAway integer,
--     cartonJauneAway integer,
--     cartonRougeAway integer,
--     tirParMatchAway double precision,
--     passeReussieAway double precision,
--     duelsAeriensRemportesAway double precision,
--     hommeDuMatchAway integer,
--     noteAway double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );

-- CREATE TABLE JoueurStatDefensiveHome (
--     joueurId integer,
--     apparitionHome integer,
--     minutesJoueesHome integer,
--     tacleHome double precision,
--     interceptionParMatchHome double precision,
--     fauteParMatchHome double precision,
--     horsJeuParMatchHome double precision,
--     degagementParMatchHome double precision,
--     dribbleSubisParMatchHome double precision,
--     blocageParMatchHome double precision,
--     butContreSonCampHome integer,
--     noteHome double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );

-- CREATE TABLE JoueurStatDefensiveAway (
--     joueurId integer,
--     apparitionAway integer,
--     minutesJoueesAway integer,
--     tacleAway double precision,
--     interceptionParMatchAway double precision,
--     fauteParMatchAway double precision,
--     horsJeuParMatchAway double precision,
--     degagementParMatchAway double precision,
--     dribbleSubisParMatchAway double precision,
--     blocageParMatchAway double precision,
--     butContreSonCampAway integer,
--     noteAway double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );

-- CREATE TABLE JoueurStatOffensiveHome (
--     joueurId integer,
--     apparitionHome integer,
--     minutesJoueesHome integer,
--     butHome integer,
--     assistHome integer,
--     tirParMatchHome integer,
--     passeCleParMatchHome double precision,
--     dribbleParMatchHome double precision,
--     fauteParMatchHome double precision,
--     horsJeuParMatchHome double precision,
--     ballonPerduParMatchHome double precision,
--     mauvaiControlParMatchHome double precision,
--     noteHome double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );

-- CREATE TABLE JoueurStatOffensiveAway (
--     joueurId integer,
--     apparitionAway integer,
--     minutesJoueesAway integer,
--     butAway integer,
--     assistAway integer,
--     tirParMatchAway integer,
--     passeCleParMatchAway double precision,
--     dribbleParMatchAway double precision,
--     fauteParMatchAway double precision,
--     horsJeuParMatchAway double precision,
--     ballonPerduParMatchAway double precision,
--     mauvaiControlParMatchAway double precision,
--     noteAway double precision,
--     Foreign key (joueurId) references joueur(joueurId)
-- );
