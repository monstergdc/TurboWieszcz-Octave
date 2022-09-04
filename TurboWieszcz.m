
% TurboWieszcz ++ MATLAB/Octave version, v2.0
% (c)2018-2022 Noniewicz.com, Jakub Noniewicz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% based directly on (translated from): my previous version written in Python
% which was based on my previous version written in Delphi
% which was based on:
% idea presented in "Magazyn Amiga" magazine by Marek Pampuch.
% also inspired by version written for iPhone by Tomek (Grych) Gryszkiewicz.
% and versions written in C, JavaScript, Pascal, PHP and as CGI by Tomek (Grych) Gryszkiewicz.
% note: there are many other versions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% timelog:
% created: 20180203 2240-2315 = 35m
% updated: 20180203 2340-0000 = 20m
% updated: 20180204 0000-0015 = 15m
% updated: 20180204 1620-1735 = 1h15m
% updated: 20180208 0040-0100 = 20m
% updated: 20180411 1905-1915 = 10m
% updated: 20220513 1130-1131 = 1m
% updated: 20220904 1745-1747 = 2m

%TODO:
%- pl proper
%- pass vars
%- chk params
%- [!] finish code


function TurboWieszcz()
  clc();
  clear();
  poem = generate_poem(4, false, 0);
	printf("%s\n", poem);
  printf("%s\n", "ąćęółżźńś");
endfunction

function r=local_rnd(n)
  r = 1+round(rand()*(n-1));   %gives 1..n int
endfunction

function sp=generate_poem(par_stanza_count, par_repetitions_ok, par_verse_mode)

  titles = {
        'Zagłada',
        'To już koniec',
        'Świat ginie',
        'Z wizytą w piekle',
        'Kataklizm',
        'Dzień z życia...',
        'Masakra',
        'Katastrofa',
        'Wszyscy zginiemy...',
        'Pokój?',
        'Koniec',
        'Koniec ludzkości',
        'Telefon do Boga',
        'Wieczne ciemności',
        'Mrok',
        'Mrok w środku dnia',
        'Ciemność',
        'Piorunem w łeb',
        'Marsz troli',
        'Szyderstwa Złego',
        'Okrponości świata',
        'Umrzeć po raz ostatni',
        'Potępienie',
        'Ból mózgu',
        'Wieczne wymioty',
        'Zatrute dusze',
        'Uciekaj',
        'Apokalipsa',
        'Złudzenie pryska',
        'Makabra',
        'Zagłada świata',
        'Śmierć',
        'Spokój'};

  stanza_count = par_stanza_count;
  repetitions_ok = par_repetitions_ok;
  verse_mode = par_verse_mode;
  
  if (stanza_count < 1)
    stanza_count = 1;
  endif

  title_id = local_rnd(length(titles));

  for z = 1:stanza_count
    number{1}{z} = local_rnd(32);
    number{2}{z} = local_rnd(32);
    number{3}{z} = local_rnd(32);
    number{4}{z} = local_rnd(32);
    ending{1}{z} = local_rnd(5);
    ending{2}{z} = local_rnd(5);
  endfor

  st = cstrcat(titles{title_id}, "\n\n");
  sz = "";
  for z = 1:stanza_count
    sz = cstrcat(sz, _build_stanza(z, verse_mode, number, ending));
  endfor
  sp = cstrcat(st, sz);
endfunction

function ss=_build_stanza(z, verse_mode, number, ending)
  M2ORDER = {{0,1,2,3}, {0,1,3,2}, {0,2,1,3}}; % ABAB, ABBA, AABB
	ss = cstrcat(
      _build_line(z, 1+M2ORDER{verse_mode+1}{0+1}, 0+1, number, ending),
      _build_line(z, 1+M2ORDER{verse_mode+1}{1+1}, 1+1, number, ending),
      _build_line(z, 1+M2ORDER{verse_mode+1}{2+1}, 2+1, number, ending),
      _build_line(z, 1+M2ORDER{verse_mode+1}{3+1}, 3+1, number, ending),
      "\n"
  );
endfunction

function sl=_build_line(z, w, w0, number, ending)
  data = {
{ %//po 10
    'Czy na te zbrodnie nie będzie kary?',
    'Opustoszały bagna, moczary',
    'Na nic się modły zdadzą ni czary',
    'Z krwi mordowanych sączą puchary',
    'To nietoperze, węże, kalmary',
    'Próżno nieszczęśni sypią talary',
    'Za co nam znosić takie ciężary',
    'Złowrogo iskrzą kóbr okulary',
    'Próżno swe modły wznosi wikary',
    'Pustoszą sny twoje złe nocne mary',
    'Próżno nieszczęśnik sypie talary',
    'Przedziwnie tka się życia logarytm',
    'Już Strach wypuścił swoje ogary',
    'Niebawem zginiesz w szponach poczwary',
    'Wbijają pale złote kafary',
    'Życie odkrywa swoje przywary',
    'Na dnie ponurej, pustej pieczary',
    'Apokalipsy nadeszły czary',
    'Upadły anioł wspomina chwałę',
    'Życie ukrywa swoje przywary',
    'Dziwnych owadów wzlatują chmary',
    'Bombowce biorą nasze namiary',
    'Nie da się chwycić z czartem za bary',
    'Próżno frajerzy sypią talary',
    'Nie da sie wyrwać czartom towaru',
    'Po co nam sączyć podłe browary',
    'Diler już nie dostarczy towaru',
    'Lokomotywa nie ma już pary',
    'Gdy nie każdego stać na browary',
    'Pożarł Hilary swe okulary',
    'Spowiły nas trujące opary',
    'To nie jest całka ani logarytm'},
{ %//po 8
    'Już na arenę krew tryska',
    'Już piana cieknie im z pyska',
    'Już hen w oddali gdzieś błyska',
    'Śmierć w kącie czai się bliska',
    'Niesamowite duchów igrzyska',
    'Już zaciskając łapiska',
    'Zamiast pozostać w zamczyskach',
    'Rzeka wylewa z łożyska',
    'Nieszczęść wylała się miska',
    'Już zaciskając zębiska',
    'Otwarta nieszczęść walizka',
    'Niczym na rzymskich boiskach',
    'Czart wznieca swe paleniska',
    'A w mroku świecą zębiska',
    'Zewsząd dochodzą wyzwiska',
    'Świętych głód wiary przyciska',
    'Ponuro patrzy z ich pyska',
    'Mgła stoi na uroczyskach',
    'Kości pogrzebią urwiska',
    'Głód wiary tak nas przyciska',
    'Runęły skalne zwaliska',
    'Czart rozpala paleniska',
    'A w mroku słychać wyzwiska',
    'Znów pusta żebraka miska',
    'Diabelskie to są igrzyska',
    'Nie powiedz diabłu nazwiska',
    'Najgłośniej słychać wyzwiska',
    'Diabelskie mają nazwiska',
    'Tam uciekają ludziska',
    'Tak rzecze stara hipiska',
    'Gdzie dawne ludzi siedliska',
    'Najgłośniej piszczy hipiska'},
{ %//po 10
    'Rwą pazurami swoje ofiary',
    'Nic nie pomoże tu druid stary',
    'To nocne zjawy i senne mary',
    'Niegroźne przy nich lwowskie batiary',
    'Pod wodzą księżnej diablic Tamary',
    'Z dala straszliwe trąbia fanfary',
    'Skąd ich przywiodły piekła bezmiary',
    'Zaś dookoła łuny, pożary',
    'A twoje ciało rozszarpie Wilk Szary',
    'Tu nie pomoże już siła wiary',
    'Tak cudzych nieszczęść piją nektary',
    'Wszystko zalewa wrzący liparyt',
    'Zabójcze są ich niecne zamiary',
    'Zatrute dusze łączą się w pary',
    'Świat pokazuje swoje wymiary',
    'Z życiem się teraz weźmiesz za bary',
    'Brak uczuć, chęci, czasem brak wiary',
    'Wspomnij, co mówił Mickiewicz stary',
    'Spalonych lasów straszą hektary',
    'Z życiem się dzisiaj weźmiesz za bary',
    'Ksiądz pozostaje nagle bez wiary',
    'Papież zaczyna odprawiać czary',
    'Tu nie pomoże paciorek, stary',
    'Niegroźne przy nich nawet Atari',
    'Takie są oto piekła bezmiary',
    'A teraz nagle jesteś już stary',
    'Mordercy liczą swoje ofiary',
    'I bez wartości są już dolary',
    'Gdzie się podziały te nenufary',
    'Upada oto dąb ten prastary',
    'Bystro śmigają nawet niezdary',
    'Już nieruchome ich awatary'},
{ %//po 8
    'Wnet na nas też przyjdzie kryska',
    'Znikąd żadnego schroniska',
    'Powietrze tnie świst biczyska',
    'Rodem z czarciego urwiska',
    'I swąd nieznośny się wciska',
    'Huk, jak z wielkiego lotniska',
    'Złowroga brzmią ich nazwiska',
    'W kącie nieśmiało ktoś piska',
    'Ktoś obok morduje liska',
    'Krwią ociekają zębiska',
    'Wokoło dzikie piarżyska',
    'I żądza czai się niska',
    'Diabeł cię dzisiaj wyzyska',
    'Płoną zagłady ogniska',
    'Gwałt niech się gwałtem odciska!',
    'Stoisz na skraju urwiska',
    'Tam szatan czarta wyiska',
    'Uciekaj, przyszłość jest mglista',
    'Nadziei złudzenie pryska',
    'Wydziobią oczy ptaszyska',
    'Padają łby na klepisko',
    'Śmierć zbiera żniwo w kołyskach',
    'Coś znowu zgrzyta w łożyskach',
    'Spadasz z wielkiego urwiska',
    'Lawa spod ziemi wytryska',
    'Wokoło grzmi albo błyska',
    'Fałszywe złoto połyska',
    'Najwięcej czart tu uzyska',
    'Owieczki Zły tu pozyska',
    'Owieczki spadły z urwiska',
    'Snują się dymy z ogniska',
    'To czarne lecą ptaszyska'}
    };

  sw = data{w}{number{w}{z}};
  sl = cstrcat(sw, _build_ending(z, w0, sw, ending), "\n");
endfunction

function se=_build_ending(z, w, s, ending)
  ENDINGS1 = {'.', '...', '.', '!', '.'};
  ENDINGS2 = {'', '...', '', '!', ''};

  chk = true;
  if (length(s) > 0)
    c = substr(s, length(s));
    if ((c == '?') || (c == '!'))
      chk = false;
    endif
  endif
  se = "";
  if ((w == 1+1) && chk)
    se = ENDINGS2{ending{0+1}{z}};
  endif
  if ((w == 3+1) && chk)
    se = ENDINGS1{ending{1+1}{z}};
  endif
endfunction

function _set_random_row(z, w)
endfunction

function b=_check_uniq_ok(z, w, value)
  b = true;
endfunction
