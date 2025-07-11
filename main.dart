import 'dart:io';

import 'STD_LIST__class.dart';



void main()
{


  //************************************************************************STD_LIST__class:Начало*************************************************************************************


  //Это класс некоего управщенного аналога std::list из C++, чтобы можно было более привычно его использовать в Dart.


  STD_LIST__class<int>std_list_ = new STD_LIST__class();    //Создаем обьект Шаблонного класса типа "int".

  //Доступные методы:

  //-push_front                                - Вставить в начало списка.
  //-push_back                                 - Вставить в конец списка.
  //-begin                                     - Получить "итератор" на первый элемент списка.
  //-last                                      - Получить "итератор" на последний элемент списка.
  //-insert                                    - Вставить значение в Список.
  //-insert_range                              - Вставить диапазон значений в Список.
  //-pop_back                                  - Удалить последний элемент из списка.
  //-pop_front                                 - Удалить первый элемент из списка.
  //-erase                                     - удалить выборочный "итератор" из списка.
  //-erase_range                               - удалить выборочный диапазон "итераторов" из списка.
  //-std_next                                  - получить следующий "итератор" за указанным.
  //-std_next_with_null                       - получить следующий "итератор" за указанным. Но если передать за место "итератора" null - то вернется начальный итератор.
  //-std_prev                                  - получить предыдущий "итератор" за указанным.
  //std_next_advanced                          - получить следующий "итератор" за указанным с указанием кол-ва шагов смещения.
  //std_prev_advanced                          - получить предыдущий "итератор" за указанным с указанием кол-ва шагов смещения.
  //std_next_advanced_with_null                - получить следующий "итератор" за указанным с указанием кол-ва шагов смещения. Но если передать за место "итератора" null - то вернется начальный итератор.
  //-splice__move_one_element                  - переместить сущетвующий элемент в списке относительного друого элемента этого же списка.
  //-splice__move_range_element                - переместить сущетвующий диапазон элемент в списке относительного друого элемента этого же списка.
  //-get__Element_by_Index_From_Begin__Slowly  - получить "итертора" по индексу элемента в списке.
  //-clear                                     - очистить весь список.
  //-size                                      - получить размер списка.
  //-iterration_lopp                           - проитерироватся по списку и выполнить функцию.
  //-range_iterrator_count                     - получить кол-во элементов в указанном диапазоне "итераторов".

  //get__value()                               - Достает из "итератора" ссылку(если элемент это обьект класса) или значение на ранее доавбленный элемент.
  //set__value()                               - заменяет уже существующиее значание по "итератору"




 
  //-------------------------------------------------------------------push_front:Начало-------------------------------------------------------------
  //Метод добавляет один элемент в начало списка.

  int value_2 = 1;

  std_list_.push_front(value_2);

  print('Begin value_push_front: ${std_list_.begin()!.get__value()}');
  //-------------------------------------------------------------------push_front:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------push_back:Начало-------------------------------------------------------------
  //Метод добавляет один элемент в конец списка.

  int value_1 = 2;

  std_list_.push_back(value_1);

  print('Last value_push_back: ${std_list_.last()!.get__value()}');
  //------------------------------------------------------------------push_back:Конец-------------------------------------------------------------

  //-------------------------------------------------------------------begin:Начало-------------------------------------------------------------
  //Получает "итератор" на первый элемент списка. Если возвращается "null" - значит итератора не существует, то есть список нулевого размера.

  STD_LIST_Iterator<int>? it_begin = std_list_.begin();

  int value_begin = it_begin!.get__value();    //Достаем самое значение из "итератора".

  print('First value_: ${value_begin}');
  //-------------------------------------------------------------------begin:Конец-------------------------------------------------------------

  //-------------------------------------------------------------------last:Начало-------------------------------------------------------------
  //Получает "итератор" на последний элемент списка.  Если возвращается "null" - значит итератора не существует, то есть список нулевого размера.

  STD_LIST_Iterator<int>? it_last = std_list_.last();

  int value_last = it_last!.get__value();    //Достаем самое значение из "итератора".

  print('Last value_: ${value_last}');
  //-------------------------------------------------------------------last:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------insert:Начало-------------------------------------------------------------
  //Метод вставляет элемент относительно указанного элемента - ДО или ПОСЛЕ.

  //----------------------------------------------
  int value_3 = 3;                  //Значение, которое нужно вставить

  STD_LIST_Iterator<int> it_1 = std_list_.last()!;  //"Итератор" в списке, относительного, которого нужно вставить.

  insert_flag insert_flag_1   = insert_flag.Before;    //Before - Значит элмент вставиться "ДО" указанного в "it_1" итератора; After - Значит элмент вставиться "После" указанного в "it_1" итератора;
  //----------------------------------------------


  STD_LIST_Iterator<int> it_return_1 = std_list_.insert(it_1, insert_flag_1, value_3);   //Метод возвращает "итератор" на всталенный элемент.

  print('it_return_1_insert: ${it_return_1.get__value()}');

  //-------------------------------------------------------------------insert:Конец-------------------------------------------------------------



  
  //-------------------------------------------------------------------insert_range:Начало-------------------------------------------------------------
  //Метод вектор элементов относительно указанного элемента - ДО или ПОСЛЕ.

  //----------------------------------------------
  List<int> vec_values_1 = [4,5,6];                      //Значения, которое нужно вставить

  STD_LIST_Iterator<int> it_2 = std_list_.begin()!;       //"Итератор" в списке, относительного, которого нужно вставить.

  insert_flag insert_flag_2   = insert_flag.After;      //Before - Значит элмент вставиться "ДО" указанного в "it_1" итератора; After - Значит элмент вставиться "После" указанного в "it_1" итератора;
  //----------------------------------------------


  STD_LIST_Iterator<int> it_return_2 = std_list_.insert_range(it_2, insert_flag_2, vec_values_1);   //Метод возвращает "итератор" на Первый всталенный элемент.

  print('it_return_2_insert_range: ${it_return_2.get__value()}');

  //-------------------------------------------------------------------insert_range:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------pop_back:Начало-------------------------------------------------------------
  //Метод удаляет Последний элемент в списке.

  std_list_.pop_back();

  //-------------------------------------------------------------------pop_back:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------pop_front:Начало-------------------------------------------------------------
  //Метод удаляет Первый элемент в списке.

  std_list_.pop_front();

  //-------------------------------------------------------------------pop_front:Конец-------------------------------------------------------------



  //-------------------------------------------------------------------erase:Начало-------------------------------------------------------------
  //Метод удаляет указанный "итератор" на элемент в списке.

  STD_LIST_Iterator<int>? it_erase_1 = std_list_.std_next(std_list_.begin());  //Удаляем второй элемент.

  STD_LIST_Iterator<int>? it_return_3 = std_list_.erase(it_erase_1);           //Метод возарщает "итератор" на следующий за удаленным элементом элемент. Если удален был последний элемент, то метод вернут "null"

  if(it_return_3 == null)
  {
    print('it_return_3_erase: null');
  }
  else
  {
    print('it_return_3_erase: ${it_return_3.get__value()}');
  }
  //-------------------------------------------------------------------erase:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------erase_range:Начало-------------------------------------------------------------
  //Метод удаляет указанный диапазон "итераторов" на элементы в списке.


  STD_LIST_Iterator<int>? it_erase_3_First = std_list_.std_next(std_list_.begin());    //Начальный "итератор" удаляемого диапазона.
  STD_LIST_Iterator<int>? it_erase_3_Last  = std_list_.std_prev(std_list_.last());     //Конченый "итератор" удаляемого диапазона.


  STD_LIST_Iterator<int>? it_return_4 = std_list_.erase_range(it_erase_3_First, it_erase_3_Last);    //Метод возарщает "итератор" на следующий за удаленным элементом элемент. Если удален был последний элемент, то метод вернут "null"

  if(it_return_4 == null)
  {
    print('it_return_4_erase: null');
  }
  else
  {
    print('it_return_4_erase: ${it_return_4.get__value()}');
  }

  //-------------------------------------------------------------------erase_range:Конец-------------------------------------------------------------


  
  //-------------------------------------------------------------------std_next:Начало-------------------------------------------------------------

  //Метод возвращает "итератор" на следующий элемент за указанным.


  STD_LIST_Iterator<int> it_6 = std_list_.begin()!;                  //"Итератор", отосительно, которого необходимо получить "итератор" на следющий за ним элемент.

  STD_LIST_Iterator<int>? it_return_7 = std_list_.std_next(it_6);   //Если следующий элемент за указанным "итератором" не существует, то функция вернет - null.

  if(it_return_7 == null)
  {
    print('it_return_7: out of list');
  }
  else
  {
    print('it_return_7: ${it_return_7.get__value()}');
  }

  //-------------------------------------------------------------------std_next:Конец-------------------------------------------------------------



  //----------------------------------------------------------------std_next_with_null:Начало-------------------------------------------------------------

  //Метод возвращает "итератор" на следующий элемент за указанным. Но если передать за место "итератора" null - то вернется начальный итератор.


  STD_LIST_Iterator<int> it_6_ = std_list_.begin()!;                  //"Итератор", отосительно, которого необходимо получить "итератор" на следющий за ним элемент.

  STD_LIST_Iterator<int>? it_return_7_ = std_list_.std_next(it_6_);   //Если следующий элемент за указанным "итератором" не существует, то функция вернет - null.

  if(it_return_7_ == null)
  {
    print('it_return_7_: out of list');
  }
  else
  {
    print('it_return_7_: ${it_return_7_.get__value()}');
  }


  //Эта функция удобная для итарации по элементам через цикл:

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //Так же по списку можно проитереироватся через "std_next":

  STD_LIST_Iterator<int>? it_loop = null;   //Устанвливаем "null" - чтобы с самой первой итарацией цикла получить первый элемент.

  for(;;)
  {
    it_loop = std_list_.std_next_with_null(it_loop);

    if(it_loop == null)
    {
      break;
    }

    int value = it_loop!.get__value();
    print(value);
  }
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  //----------------------------------------------------------------std_next_with_null:Конец-------------------------------------------------------------



  //-------------------------------------------------------------------std_prev:Начало-------------------------------------------------------------

  //Метод возвращает "итератор" на предыдущий элемент за указанным.


  STD_LIST_Iterator<int> it_8 = std_list_.last()!;                  //"Итератор", отосительно, которого необходимо получить "итератор" на предыдущий за ним элемент.

  STD_LIST_Iterator<int>? it_return_9 = std_list_.std_prev(it_8);   //Если предыдущий элемент за указанным "итератором" не существует, то функция вернет - null.

  if(it_return_9 == null)
  {
    print('it_return_9: out of list');
  }
  else
  {
    print('it_return_9: ${it_return_9.get__value()}');
  }

  //-------------------------------------------------------------------std_prev:Конец-------------------------------------------------------------


  //-------------------------------------------------------------------std_next_advanced:Начало-------------------------------------------------------------

  //Метод возвращает "итератор" на следующий элемент за указанным.


  STD_LIST_Iterator<int> it_61 = std_list_.begin()!;                  //"Итератор", отосительно, которого необходимо получить "итератор" на следющий за ним элемент.

  int num_step_1 = 1;                                                //Кол-во шагов Вправо, которое нужно сделать от указанного в "it_61" "итератора". То есть: 0 - значит это указанный "it_61" "итератор", если 1 - то одиг шаг вправо от этого итертора, 2 - значит 2 шага ... итд...

  STD_LIST_Iterator<int>? it_return_71 = std_list_.std_next_advanced(it_61, num_step_1);   //Если следующий элемент за указанным "итератором" не существует, то функция вернет - null.

  if(it_return_71 == null)
  {
    print('it_return_71: out of list');
  }
  else
  {
    print('it_return_71: ${it_return_71.get__value()}');
  }

  //-------------------------------------------------------------------std_next_advanced:Конец-------------------------------------------------------------



  //-------------------------------------------------------------------std_prev_advanced:Начало-------------------------------------------------------------

  //Метод возвращает "итератор" на следующий элемент за указанным.


  STD_LIST_Iterator<int> it_62 = std_list_.begin()!;                  //"Итератор", отосительно, которого необходимо получить "итератор" на следющий за ним элемент.

  int num_step_2 = 1;                                                //Кол-во шагов Влево, которое нужно сделать от указанного в "it_62" "итератора". То есть: 0 - значит это указанный "it_62" "итератор", если 1 - то одиг шаг Влево от этого итертора, 2 - значит 2 шага ... итд...

  STD_LIST_Iterator<int>? it_return_72 = std_list_.std_prev_advanced(it_61, num_step_1);   //Если следующий элемент за указанным "итератором" не существует, то функция вернет - null.

  if(it_return_72 == null)
  {
    print('it_return_72: out of list');
  }
  else
  {
    print('it_return_72: ${it_return_72.get__value()}');
  }

  //-------------------------------------------------------------------std_prev_advanced:Конец-------------------------------------------------------------




  //-------------------------------------------------------------------clear:Начало-------------------------------------------------------------

  //Метод удаляет все элементы в списке.

  std_list_.clear();
  //-------------------------------------------------------------------clear:Конец-------------------------------------------------------------



  //###########################################################
  std_list_.push_back(1);
  std_list_.push_back(2);
  std_list_.push_back(3);
  std_list_.push_back(4);
  std_list_.push_back(5);
  std_list_.push_back(6);
  std_list_.push_back(7);
  std_list_.push_back(8);
  std_list_.push_back(9);
  //###########################################################




  //--------------------------------------------------------------splice__move_one_element:Начало-------------------------------------------------------------

  //Данный метод перемещает указанный "итератор" в списке в позицию относительно указанного "итератора" в этом же списке.

  STD_LIST_Iterator<int>? it_10 = std_list_.std_prev(std_list_.last());        //"Итератор", отосительно, которого необходимо переместить "итератор" it_move_1.

  insert_flag insert_flag_3    = insert_flag.After;        //Before - Значит элемент вставиться "ДО" указанного в "it_1" итератора; After - Значит элмент вставиться "После" указанного в "it_1" итератора;

  STD_LIST_Iterator<int>? it_move_1 = std_list_.get__Element_by_Index_From_Begin__Slowly(5);

  std_list_.splice__move_one_element(it_10, insert_flag_3, it_move_1);

  //--------------------------------------------------------------splice__move_one_element:Конец-------------------------------------------------------------


  //---------------------------------------------------------------splice__move_range_element:Начало-------------------------------------------------------------

  //Данный метод перемещает диапазон указанных "итераторов" в списке в позицию относительно указанного "итератора" в этом же списке.

  STD_LIST_Iterator<int>? it_11 = std_list_.std_prev(std_list_.last());        //"Итератор", отосительно, которого необходимо переместить "итератор" it_move_1.

  insert_flag insert_flag_4    = insert_flag.After;        //Before - Значит элемент вставиться "ДО" указанного в "it_1" итератора; After - Значит элмент вставиться "После" указанного в "it_1" итератора;

  STD_LIST_Iterator<int>? it_move_range_frist = std_list_.get__Element_by_Index_From_Begin__Slowly(1);
  STD_LIST_Iterator<int>? it_move_range_last  = std_list_.get__Element_by_Index_From_Begin__Slowly(3);

  std_list_.splice__move_range_element(it_11, insert_flag_4, it_move_range_frist, it_move_range_last);

  //---------------------------------------------------------------splice__move_range_element:Конец-------------------------------------------------------------



  //---------------------------------------------------------get__Element_by_Index_From_Begin__Slowly:Начало-------------------------------------------------------------

  //Данный метод возвращает "итератор" по индексу элемента в списке. Незнаю зачем он может понадобится, так как метод медленный, потому что при каждом вызове функция проходит последовтаельно всегда от самого начала до указанного индекса элемента в списке.Но пусть будет.


  int index_1 = 1;   //Индекс 0 - значит, что метод возвратит "итератор" на Первый элемент в списке. Индекс 1 - значит, что "итератор" возвратит второй элемент в списке .... итд.


  STD_LIST_Iterator<int>? it_index_1 = std_list_.get__Element_by_Index_From_Begin__Slowly(1);    //Если Индекс указан таким образом, что он выходит за пределы списка - то метод вернут null.

  //-------------------------------------------------
  if(it_index_1 == null)
  {
    print('it_index_1: index out of list');
  }
  else
  {
    print('it_index_1: ${it_index_1.get__value()}');
  }
  //-------------------------------------------------


  //---------------------------------------------------------get__Element_by_Index_From_Begin__Slowly:Конец-------------------------------------------------------------



  //-------------------------------------------------------------------size:Начало-------------------------------------------------------------

  //Метод возвращает размер списка.

  print('STD_LIST_size: ${std_list_.size()}');

  //-------------------------------------------------------------------size:Конец-------------------------------------------------------------


  //---------------------------------------------------------------range_iterrator_count:Начало-------------------------------------------------------------

  //Метод возвращает кол-во элементов между указанными "итераторами".

  STD_LIST_Iterator<int>? it_range_Frist_2 = std_list_.get__Element_by_Index_From_Begin__Slowly(1);
  STD_LIST_Iterator<int>? it_range_Last_2  = std_list_.get__Element_by_Index_From_Begin__Slowly(7);


  final int count_element = std_list_.range_iterrator_count(it_range_Frist_2, it_range_Last_2);   //Если "итератор"

  print('count_element: ${count_element}');

  //---------------------------------------------------------------range_iterrator_count:Конец-------------------------------------------------------------




  //-------------------------------------------------------------------iterration_loop:Начало-------------------------------------------------------------

  //Метод итерируется по указанному диапазону "итераторов" и для каждого итератора запускает Пользовательскую функцию.

  STD_LIST_Iterator<int>? it_range_Frist_3 = std_list_.get__Element_by_Index_From_Begin__Slowly(1);
  STD_LIST_Iterator<int>? it_range_Last_3  = std_list_.get__Element_by_Index_From_Begin__Slowly(7);


  bool Function(STD_LIST__class<int> class_ref, STD_LIST_Iterator<int>) user_func;        //Функция, которая удет вызываться для каждого итерируемого "итератора" из указанного диапазона.

  user_func = (STD_LIST__class<int> class_ref, STD_LIST_Iterator<int> it)
  {
    //class_ref - ссылка на данный обьект класса.
    //it        - итерируемый "итератор"

    print('it: ${it.get__value()}');


    return true;   //true - значит нужно продолжить итерацию по указанному диапазону "итераторов". false - значит нужно завершить цикл итерации и завершить выполненеи самом функции "iterration_lopp".

  };


  std_list_.iterration_lopp(it_range_Frist_3, it_range_Last_3, user_func);



  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //Так же по списку можно проитереироватся через "std_next":

  STD_LIST_Iterator<int>? it_loop_ = null;

  for(;;)
  {
    it_loop_ = std_list_.std_next_with_null(it_loop_);

    if(it_loop_ == null)
    {
      break;
    }

    int value = it_loop_!.get__value();
    print(value);
  }
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  //-------------------------------------------------------------------iterration_loop:Конец-------------------------------------------------------------









  //----------------------------------------------------------------get__value:Начало-------------------------------------------------------------------------

  //Достает из "итератора" ссылку(если элемент это обьект класса) или значение на ранее доавбленный элемент.

  STD_LIST_Iterator<int>? it_for_dereferenced = std_list_.begin();

  print('it_for_dereferenced: ${it_for_dereferenced!.get__value()}');

  //----------------------------------------------------------------get__value:Конец-------------------------------------------------------------------------



  //----------------------------------------------------------------set__value:Начало-------------------------------------------------------------------------

  //Устанавливает новое значение на "итератор".

  STD_LIST_Iterator<int>? it_for_NewValue = std_list_.begin();

  it_for_NewValue!.set__value(555);

  print('it_for_NewValue: ${it_for_NewValue.get__value()}');


  //ИЛИ ПРОСТО ЧЕРЕЗ get__value() если доабвленый обьект в список - это обьект класса.

  //----------------------------------------------------------------set__value:Конец-------------------------------------------------------------------------




  //************************************************************************STD_LIST__class:Конец*************************************************************************************



}
