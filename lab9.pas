{Программа №1 
*Лабораторная работа №9 по основам алгоритмизации и программирования 
*Тема "МЕНЮ РАБОТЫ С ФАЙЛАМИ" 
*Язык программирования: Pascal 
*Разработал И. С. Владимиров 
*Дата 12.12.2022 
*Задание. 
В меню предусмотреть следующие пункты: 
МЕНЮ 
1. Создание файла 
2. Просмотр файла 
3. Редактирование файла 
3.1 Добавление элементов в файл 
3.1.1 Добавление в конец файла 
3.1.2 Добавление в начало файла 
3.1.3 Добавление в середину файла 
3.2 Изменение элементов в файле 
3.3 Удаление элементов из файла 
3.3.1. Удаление элемента 
3.3.2. Удаление всего файла 
4. Выход 
*} 
program menu_lab9;

uses crt;


type
  fileType = file of integer;

var
  f, g: fileType; 
  menuNum, redacNum, dobavNum, deletenum, x, d, i: integer; 
  YesNow, YesNowExit, s, nf: string; 
//создание файла 
function sozdanie_file(var s: string): fileType;
var
  f: fileType; 
  i: integer;
begin
  write('Введите название для файла: '); 
  readln(s); 
  assign(f, s); 
  write('Файл создан под названием: '); 
  writeln(s); 
  sozdanie_file := f; 
end; 
//просмотр файла 
procedure prosmotr_file(f: fileType);
var
  x: integer;
begin
  reset(f); 
  while not eof(f) do 
  begin
    read(f, x); 
    writeln(x); 
  end; 
  close(f); 
end; 
//добавление чисел в файл 
function edit(var f: fileType; var c: integer): fileType;
var
  x, i: integer;
begin
  rewrite(f); 
  writeln('Введите элементы: '); 
  for i := 1 to c do 
  begin
    write('Введите ', i, '-е число: '); 
    readln(x); 
    write(f, x); 
  end; 
  close(f); 
  edit := f; 
end; 
//добавление в начало 
procedure dobavlenie_v_nachalo(f: fileType);
var
  j, y, n2: integer;
begin
  reset(f); 
  rewrite(g); 
  while not eof(f) do
  begin
    read(f, x); 
    write(g, x); 
  end; 
  close(f); 
  close(g); 
  rewrite(f); 
  write('Введите кол-во элементов: '); 
  readln(n2); 
  writeln('Введите элементы: '); 
  for j := 1 to n2 do
  begin
    write('Введите ', j, '-е число: '); 
    readln(x); 
    write(f, x); 
  end; 
  reset(g); 
  while not eof(g) do
  begin
    read(g, x); 
    write(f, x); 
  end; 
  close(f); 
  close(g); 
  clrscr;  
  reset(f);  
  writeln('Файл после дозаписи: '); 
  while not eof(f) do
  begin
    read(f, x); 
    write(x, ' '); 
  end; 
  readkey();
  close(f);
end; 
//добавление в центр 
procedure dobavlenie_v_serediny(f: fileType);
var
  j, y, x: integer;
begin
  reset(f); 
  rewrite(g); 
  while not eof(f) do
  begin
    read(f, y); 
    write(g, y); 
  end; 
  close(f); 
  close(g); 
  write('Введите кол-во элементов:'); 
  readln(x); 
  reset(g); 
  rewrite(f); 
  while not eof(g) do
  begin
    if not ((filepos(g)) = ceil((filesize(g)) / 2)) then begin read(g, y); write(f, y); end 
    else begin
      writeln('Введите элементы: '); 
      for j := 1 to x do 
      begin
        write('Введите ', j, '-е число: '); 
        readln(y); 
        write(f, y); 
      end; 
      read(g, y); 
      write(f, y); 
    end; 
  end; 
  close(f); 
  close(g); 
  clrscr; 
  reset(f); 
  writeln('Файл после дозаписи: '); 
  while not eof(f) do
  begin
    read(f, x); 
    write(x, ' '); 
  end; 
  readkey(); 
  close(f); 
end; 
//добавление в конец 
procedure dobavlenie_v_konez(f: fileType);
var
  i, n2: integer;
begin
  reset(f); 
  write('Введите кол-во элементов: '); 
  readln(n2); 
  writeln('Введите элементы: '); 
  for i := 1 to n2 do
  begin
    write('Введите ', i, '-е число: '); 
    readln(x); 
    seek(f, filesize(f)); 
    write(f, x); 
  end;
  close(f);
  clrscr; 
  reset(f); 
  writeln('Файл после дозаписи: '); 
  while not eof(f) do
  begin
    read(f, x); 
    write(x, ' '); 
  end; 
  close(f); 
  readkey; 
  clrscr; 
end; 
//удаление полностью файла 
procedure delete_fail(var f: fileType);
begin
  erase(f); 
  writeln('Файл был удален'); 
end; 
//удаление элемента 
procedure delete_element(f: fileType; var i: integer);
var
  k, counter, udal: real;
begin
  counter := 1; 
  k := 0; 
  assign(f, s); 
  assign(g, 'file2.txt'); 
  if fileexists(s) = true then begin
    reset(f); 
    rewrite(g); 
    writeln('Номер - число'); 
    while not eof(f) do
    begin
      read(f, x); 
      write(g, x); 
      writeln(' ':2, counter, ')', ' ':6, x); 
      counter := counter + 1; 
    end; 
    reset(g); 
    rewrite(f); 
    write('Введите элемент: '); 
    readln(udal); 
    while (udal < 1.0) or (udal > counter) do writeln('Нет такого элемента!'); 
    while not eof(g) do 
    begin
      k := k + 1; 
      if k <> udal then begin
        read(g, x); 
        write(f, x); 
      end 
      else 
        read(g, x); 
    end; 
    close(f); 
    close(g); 
    writeln('Элемент из файла удален'); 
  end 
  else writeln('Создайте файл!'); 
end; 
//изменение элемента 
procedure izmenenie_fail(f: fileType; var i: integer; var x: integer);
var
  y: integer;
begin
  if fileexists(s) = false then writeln('Ошибка!') else begin
    reset(f); 
    rewrite(g); 
    while not eof(f) do
    begin
      read(f, y); 
      write(g, y); 
    end; 
    close(f); 
    close(g); 
    reset(g); 
    rewrite(f); 
    while not eof(g) do
    begin
      read(g, y); 
      if filepos(g) = i then write(f, x) 
      else 
        write(f, y); 
    end; 
    close(f); 
    close(g); 
  end; 
end; 
//ветка удаление 
procedure deletecase(deletnum: integer);
begin
  case deletnum of 
    1: delete_element(f, i); 
    2: delete_fail(f); 
  end; 
end; 
//ветка добавление 
procedure dobavlenie(dobavNum: integer);
begin
  case dobavNum of 
    1: dobavlenie_v_konez(f);  
    2: dobavlenie_v_nachalo(f); 
    3: dobavlenie_v_serediny(f); 
  end; 
end;  
//ветка визуальное добавление/удаление 
//визуальная чатст 2 меню 
procedure redact(redacNum: integer);
var
  counter: real;
begin
  case redacNum of 
    1:
      begin
        clrscr; 
        gotoxy(8, 1); 
        writeln('МЕНЮ'); 
        gotoxy(1, 2); 
        writeln('1. Создание файла'); 
        gotoxy(1, 3); 
        writeln('2. Просмотр файла'); 
        gotoxy(1, 4); 
        writeln('3. Редактирование файла'); 
        gotoxy(4, 5); 
        writeln('3.1 Добавление элементов в файл'); 
        gotoxy(7, 6); 
        writeln('3.1.1 Добавление в конец файла'); 
        gotoxy(7, 7); 
        writeln('3.1.2 Добавление в начало файла'); 
        gotoxy(7, 8); 
        writeln('3.1.3 Добавление в середину файла'); 
        gotoxy(7, 9); 
        writeln('3.1.4 Назад'); 
        gotoxy(4, 10);
        writeln('3.2 Изменение элементов в файле'); 
        gotoxy(4, 11); 
        writeln('3.3 Удаление элементов из файла'); 
        gotoxy(1, 12); 
        writeln('4. Выход'); 
        writeln(); 
        write('Введите номер действия: '); 
        readln(dobavNum); 
        dobavlenie(dobavNum); 
      end; 
    2:
      begin
        counter := 1; 
        reset(f); 
        writeln('Номер - число'); 
        while not eof(f) do
        begin
          read(f, x); 
          writeln(' ':2, counter, ')', ' ':6, x); 
          counter := counter + 1; 
        end; 
        write('Введите позицию: '); 
        readln(i); 
        if (i > 0) and (i < filesize(f)) then begin
          write('Введите число: '); 
          readln(x); 
          close(f); 
          izmenenie_fail(f, i, x); end; 
      end; 
    3:
      begin
        clrscr; 
        gotoxy(8, 1); 
        writeln('МЕНЮ'); 
        gotoxy(1, 2); 
        writeln('1. Создание файла'); 
        gotoxy(1, 3); 
        writeln('2. Просмотр файла'); 
        gotoxy(1, 4); 
        writeln('3. Редактирование файла'); 
        gotoxy(4, 5); 
        writeln('3.1 Добавление элементов в файл'); 
        gotoxy(4, 6); 
        writeln('3.2 Изменение элементов в файле'); 
        gotoxy(4, 7); 
        writeln('3.3 Удаление элементов из файла'); 
        gotoxy(7, 8); 
        writeln('3.3.1 Удаление элемента'); 
        gotoxy(7, 9); 
        writeln('3.3.2 Удаление всего файла'); 
        gotoxy(7, 10); 
        writeln('3.3.3 Назад'); 
        gotoxy(1, 11); 
        writeln('4. Выход'); 
        writeln(); 
        write('Введите номер действия: '); 
        readln(deletenum); 
        deletecase(deletenum); 
      end; 
  end; 
end; 
//визуальная часть 1 меню 
procedure menu(menuNum: integer);
begin
  clrscr; 
  case menuNum of 
    1:
      begin
        gotoxy(1, 1); 
        writeln('*Создание файла '); 
        f := sozdanie_file(s); 
        write('Введите кол-во элементов: '); 
        readln(i); 
        f := edit(f, i); 
        clrscr; 
        prosmotr_file(f); 
      end; 
    2:
      begin
        gotoxy(1, 1); 
        writeln('*Просмотр файла: '); 
        if fileExists(s) = true then begin
          prosmotr_file(f); 
        end 
        else begin
          gotoxy(1, 1); 
          writeln('*Создание файла'); 
          sozdanie_file(s); 
        end; 
        writeln(); 
        writeln('Нажмите любую клавищу, чтобы вернуться в меню: '); 
        readkey; 
        clrscr; 
      end; 
    3:
      begin
        gotoxy(8, 1); 
        writeln('МЕНЮ'); 
        gotoxy(1, 2); 
        writeln('1. Создание файла'); 
        gotoxy(1, 3); 
        writeln('2. Просмотр файла'); 
        gotoxy(1, 4); 
        writeln('3. Редактирование файла'); 
        gotoxy(4, 5); 
        writeln('3.1 Добавление элементов в файл'); 
        gotoxy(4, 6); 
        writeln('3.2 Изменение элементов в файле');
        gotoxy(4, 7); 
        writeln('3.3 Удаление элементов из файла'); 
        gotoxy(1, 8); 
        writeln('4. Выход'); 
        writeln(); 
        write('Введите номер действия: '); 
        readln(redacNum); 
        redact(redacNum); 
      end; 
  end; 
end;

begin
  assign(g, 'file2.txt'); 
  repeat
    clrscr; 
    gotoxy(8, 1); 
    writeln('МЕНЮ'); 
    gotoxy(1, 2); 
    writeln('1. Создание файла'); 
    gotoxy(1, 3); 
    writeln('2. Просмотр файла'); 
    gotoxy(1, 4); 
    writeln('3. Редактирование файла'); 
    gotoxy(1, 5); 
    writeln('4. Выход'); 
    writeln(); 
    write('Введите номер действия: '); 
    readln(menuNum); 
    menu(menuNum); 
  until menuNum = 4; 
end.