import 'dart:io';


enum insert_flag
{
  Before,
  After,
}

class STD_LIST_Iterator<T>
{

  //--------------------------Public:------------------------------

  STD_LIST_Iterator(this._value);

  T get__value()
  {
    return _value;
  }

  void set__value(T value_)
  {
    _value = value_;
  }


  //--------------------------Private:------------------------------
  T _value;

  STD_LIST_Iterator<T>? _prev = null;
  STD_LIST_Iterator<T>? _next = null;
}

class STD_LIST__class<T>
{

  //-------------------------Private:egin----------------------
  STD_LIST_Iterator<T>? _Begin_Element_ref = null;

  STD_LIST_Iterator<T>? _Last_Element_ref = null;

  int _Size = 0;
  //-------------------------Private:end----------------------
/*
  iterration_lopp
  range_iterrator_count
  begin
  last
  get__Element_by_Index_From_Begin__Slowly
  push_back
  push_front
  insert
  insert_range
  pop_back
  pop_front
  erase
  erase_range
  std_next
  std_prev
  std_prev_advanced
  std_prev_advanced
  splice__move_one_element
  splice__move_range_element
  clear
  size
  */

  void iterration_lopp(STD_LIST_Iterator<T>? First_Range_it, STD_LIST_Iterator<T>? Last_Range_it, bool Function(STD_LIST__class<T> class_ref, STD_LIST_Iterator<T>) user_func)
  {

    if(First_Range_it != null && Last_Range_it != null)
    {

      //----------------------------------------------
      STD_LIST_Iterator<T> temp_it = First_Range_it!;
      //----------------------------------------------


      //----------------------------------------------------
      while (temp_it != Last_Range_it)
      {
        final bool res = user_func(this, temp_it);

        if (res == false)
        {
          return; //Значит Пользователь возвратил сообщение из функции, что он хочет завершить итерацию.
        }

        temp_it = temp_it._next!;
      }

      user_func(this, temp_it);
      //----------------------------------------------------
    }

    
  }

  int range_iterrator_count(STD_LIST_Iterator<T>? First_Range_it, STD_LIST_Iterator<T>? Last_Range_it)
  {

    //Функция работает с учетом того, что - First_Range_it и Last_Range_it - являются корректными и валидными. Предоставить First_Range_it и Last_Range_it - корректными и валидными являвется задача того, что вызывает эту функцию, а не самой даннйо функции.

    //----------------------------------------------
    int cntr = 0;
    STD_LIST_Iterator<T> temp_it = First_Range_it!;
    //----------------------------------------------


    //----------------------------------------------------
    for(;;)
    {

      //----------------------------------
      cntr++;

      temp_it = temp_it._next!;

      if(temp_it == Last_Range_it)
      {
        cntr++;         //Прибавляем заключительную итерацию.

        return cntr;
      }
      //----------------------------------

    }
    //----------------------------------------------------

  }

  STD_LIST_Iterator<T> begin()
  {
    return _Begin_Element_ref!;
  }

  STD_LIST_Iterator<T> last()
  {
    return _Last_Element_ref!;
  }

  STD_LIST_Iterator<T>? get__Element_by_Index_From_Begin__Slowly(int Index)
  {

    //-----------------------------
    if(Index >= _Size)
    {
      return null;
    }
    //-----------------------------


    //-----------------------------------------------------------------
    int cntr = 0;

    STD_LIST_Iterator<T> it = _Begin_Element_ref!;

    for(int i = 0; i < Index; i++ )
    {
      it = it._next!;
    }
    //-----------------------------------------------------------------

    return it;

  }

  STD_LIST_Iterator<T>? get__Element_by_Index_From_Iterator__Slowly(STD_LIST_Iterator<T>? user_it, insert_flag insert_flag_, int Index)
  {

    int cntr = 0;

    if(insert_flag_ == insert_flag.Before)
    {

      //-----------------------------------------------------------------
      STD_LIST_Iterator<T>? it = user_it;

      for(int i = 0; i < Index; i++ )
      {
        if(it!._prev == null)
        {
          return null;
        }

        it = it._prev!;
      }
      //-----------------------------------------------------------------

      return it;

    }
    else
    {

      //-----------------------------------------------------------------
      STD_LIST_Iterator<T>? it = user_it;

      for(int i = 0; i < Index; i++ )
      {
        if(it!._next == null)
        {
          return null;
        }

        it = it._next!;
      }
      //-----------------------------------------------------------------

      return it;

    }



  }

  void push_back(T value)
  {
    final new_element = new STD_LIST_Iterator(value); //выделяем память под элемент.

    _push_back_iterrator(new_element, true);
  }

  void push_front(T value)
  {
    final new_element = new STD_LIST_Iterator(value); //выделяем память под элемент.

    _push_front_iterrator(new_element, true);
  }

  STD_LIST_Iterator<T> insert(STD_LIST_Iterator<T>? Iterrator_to_Elem, insert_flag insert_flag_, T value)
  {
    //Iterrator_to_Elem   - ссылка на уже добавленный и существуюший элемент в Списке.
    //insert_flag_        - флаг добавления: before - значит доавбить элемент "value" ДО элемента "Iterrator_to_Elem" в списке; after - значит доавбить элемент "value" ПОСЛЕ элемента "Iterrator_to_Elem" в списке.

    final new_element = new STD_LIST_Iterator(value); //выделяем память под элемент.

    return _insert_iterrator(Iterrator_to_Elem!, insert_flag_, new_element, true);
  }

  STD_LIST_Iterator<T> insert_range(STD_LIST_Iterator<T>? Iterrator_to_Elem, insert_flag insert_flag_, List<T> vec_value)
  {
    //Iterrator_to_Elem   - ссылка на уже добавленный и существуюший элемент в Списке.
    //insert_flag_        - флаг добавления: before - значит доавбить элемент "value" ДО элемента "Iterrator_to_Elem" в списке; after - значит доавбить элемент "value" ПОСЛЕ элемента "Iterrator_to_Elem" в списке.


    //----------------------------------------------------------------------------------------
    final List<STD_LIST_Iterator<T>> vec__new_elements = List.generate(vec_value.length, (index)
    {
      return new STD_LIST_Iterator<T>(vec_value[index]);
    });
    //----------------------------------------------------------------------------------------



    //----------------------------------------------------------------------------------------
    for(int i=0; i < vec__new_elements.length; i++ )
    {
      if(i < (vec__new_elements.length - 1))
      {
        vec__new_elements[i]._next   = vec__new_elements[i+1];
        vec__new_elements[i+1]._prev = vec__new_elements[i];
      }
    }
    //----------------------------------------------------------------------------------------



    return _insert_iterrator_range(Iterrator_to_Elem!, insert_flag_, vec__new_elements.first, vec__new_elements.last, true);
  }



  void pop_back()
  {

    //-------------------------------
    if(_Size == 0)
    {
      return;
    }
    //-------------------------------


    final STD_LIST_Iterator<T> removed_Element = _Last_Element_ref!;  // Сохраняем ссылку на удаляемый элемент, чтобы обнулить его связи


    //-------------------------------
    if(_Size == 1)
    {
      _Begin_Element_ref = null;
      _Last_Element_ref  = null;
    }
    else
    {
      (_Last_Element_ref!._prev)!._next = null;

      _Last_Element_ref = _Last_Element_ref!._prev;
    }
    //-------------------------------


    _Size = _Size-1;


    //----------------------------------
    removed_Element._next = null;
    removed_Element._prev = null;
    //----------------------------------

  }

  void pop_front()
  {

    //-------------------------------
    if(_Size == 0)
    {
      return;
    }
    //-------------------------------


    final STD_LIST_Iterator<T> removed_Element = _Begin_Element_ref!;  // Сохраняем ссылку на удаляемый элемент, чтобы обнулить его связи


    //-------------------------------
    if(_Size == 1)
    {
      _Begin_Element_ref = null;
      _Last_Element_ref  = null;
    }
    else
    {
      (_Begin_Element_ref!._next)!._prev = null;

      _Begin_Element_ref = _Begin_Element_ref!._next;
    }
    //-------------------------------


    _Size = _Size-1;


    //----------------------------------
    removed_Element._next = null;
    removed_Element._prev = null;
    //----------------------------------

  }


  STD_LIST_Iterator<T>? erase(STD_LIST_Iterator<T>? Iterrator_to_Elem)
  {
    return _erase_iterrator(Iterrator_to_Elem!, true);
  }

  STD_LIST_Iterator<T>? erase_range(STD_LIST_Iterator<T>? First_Range_it, STD_LIST_Iterator<T>? Last_Range_it)
  {
    return _erase_iterrator_Range(First_Range_it!, Last_Range_it!, true);
  }

  STD_LIST_Iterator<T>? std_next_with_null(STD_LIST_Iterator<T>? Iterrator_to_Elem)
  {
    if(Iterrator_to_Elem == null)
    {
      return _Begin_Element_ref;
    }
    else
    {
      return Iterrator_to_Elem!._next;
    }
  }
  
  STD_LIST_Iterator<T>? std_next(STD_LIST_Iterator<T>? Iterrator_to_Elem)
  {
    return Iterrator_to_Elem!._next;
  }

  STD_LIST_Iterator<T>? std_prev(STD_LIST_Iterator<T>? Iterrator_to_Elem)
  {
    return Iterrator_to_Elem!._prev;
  }

  STD_LIST_Iterator<T>? std_next_advanced_with_null(STD_LIST_Iterator<T>? Iterrator_to_Elem, int num_step)
  {

    if(Iterrator_to_Elem == null)
    {
      return _Begin_Element_ref;
    }
    else
    {
      return std_next_advanced(Iterrator_to_Elem, num_step);
    }

  }
  
  STD_LIST_Iterator<T>? std_next_advanced(STD_LIST_Iterator<T>? Iterrator_to_Elem, int num_step)
  {

    STD_LIST_Iterator<T> it_temp = Iterrator_to_Elem!;

    //-------------------------------------
    for(int i = 0; i < num_step; i++ )
    {

      if(it_temp._next == null)
      {
        return null;
      }

      it_temp = it_temp._next!;
    }
    //-------------------------------------

    return it_temp;
  }

  STD_LIST_Iterator<T>? std_prev_advanced(STD_LIST_Iterator<T>? Iterrator_to_Elem, int num_step)
  {

    STD_LIST_Iterator<T> it_temp = Iterrator_to_Elem!;

    //-------------------------------------
    for(int i = 0; i < num_step; i++ )
    {

      if(it_temp._prev == null)
      {
        return null;
      }

      it_temp = it_temp._prev!;
    }
    //-------------------------------------

    return it_temp;

  }

  void splice__move_one_element(STD_LIST_Iterator<T>? iterator_where_to_move, insert_flag insert_flag_, STD_LIST_Iterator<T>? which_iterator_to_move)
  {
    //Данная функция перемещает один итератор "which_iterator_to_move" в позицию итератора "iterator_where_to_move" с установление флага пермещения "insert_flag_" ДО[то есть СЛЕВА] или ПОСЛЕ[то есть СПРАВА] итератора "iterator_where_to_move".

    _erase_iterrator(which_iterator_to_move!, false);

    _insert_iterrator(iterator_where_to_move!, insert_flag_, which_iterator_to_move, false);
  }

  void splice__move_range_element(STD_LIST_Iterator<T>? iterator_where_to_move, insert_flag insert_flag_, STD_LIST_Iterator<T>? first, STD_LIST_Iterator<T>? last)
  {

    //Данная функция перемещает диапазон итераторов от "first" до "last" в позицию итератора "iterator_where_to_move" с установление флага пермещения "insert_flag_" ДО или ПОСЛЕ итератора "iterator_where_to_move".
    //Если пермещение диапазона [first-last] происходит ДО "iterator_where_to_move", то диапазон "вставляется" крайним итерратором "last" прилиегающим ДО итератора, то есть СЛЕВА "iterator_where_to_move":  [first-last][iterator_where_to_move]
    //Если пермещение диапазона [first-last] происходит ПОСЛЕ "iterator_where_to_move", то диапазон "вставляется" крайним итерратором "first" прилиегающим ПОСЛЕ итератора, то есть СПРАВА "iterator_where_to_move":  [iterator_where_to_move][first-last]

    _erase_iterrator_Range(first!, last!, false);

    _insert_iterrator_range(iterator_where_to_move!, insert_flag_, first!, last!, false);
  }

  void splice__move_one_external_STD_LIST(STD_LIST_Iterator<T> iterator_where_to_move, insert_flag insert_flag_, STD_LIST__class<T> which_STD_LIST_to_move)
  {

    //Данная функция перемещает другой существующий списк "STD_LIST" "which_STD_LIST_to_move" в данный "STD_LIST" в позицию итератора данного "STD_LIST" "iterator_where_to_move" с установление флага пермещения "insert_flag_" ДО[то есть СЛЕВА] или ПОСЛЕ[то есть СПРАВА] итератора "iterator_where_to_move".

    //Лень, все равно никогда такое не использовал.
  }

  void splice__move_one_element_from_external_STD_LIST(STD_LIST_Iterator<T> iterator_where_to_move, insert_flag insert_flag_, STD_LIST__class<T> which_STD_LIST_to_move, STD_LIST_Iterator<T> which_iterator_to_move)
  {

    //Данная функция перемещает один итератор "which_iterator_to_move" из другого существующего списка "STD_LIST" "which_STD_LIST_to_move" в данный "STD_LIST" в позицию итератора данного "STD_LIST" "iterator_where_to_move" с установление флага пермещения "insert_flag_" ДО[то есть СЛЕВА] или ПОСЛЕ[то есть СПРАВА] итератора "iterator_where_to_move".

    //Лень, все равно никогда такое не использовал.
  }

  void splice__move_range_element_from_external_STD_LIST(STD_LIST_Iterator<T> iterator_where_to_move, insert_flag insert_flag_, STD_LIST__class<T> which_STD_LIST_to_move, STD_LIST_Iterator<T> first, STD_LIST_Iterator<T> last)
  {

    //Данная функция перемещает диапазон итераторов от "first" до "last" другого существующего списка "STD_LIST" "which_STD_LIST_to_move" в данный "STD_LIST" в позицию итератора "iterator_where_to_move" с установление флага пермещения "insert_flag_" ДО или ПОСЛЕ итератора "iterator_where_to_move".
    //Если пермещение диапазона [first-last] происходит ДО "iterator_where_to_move", то диапазон "вставляется" крайним итерратором "last" прилиегающим ДО итератора, то есть СЛЕВА "iterator_where_to_move":  [first-last][iterator_where_to_move]
    //Если пермещение диапазона [first-last] происходит ПОСЛЕ "iterator_where_to_move", то диапазон "вставляется" крайним итерратором "first" прилиегающим ПОСЛЕ итератора, то есть СПРАВА "iterator_where_to_move":  [iterator_where_to_move][first-last]

    //Лень, все равно никогда такое не использовал.
  }


  void clear()
  {
    _clear(true);
  }

  int size()
  {
    return _Size;
  }


  //-------------------------------------------------------Private:----------------------------------------------------------------------


  void _push_back_iterrator(STD_LIST_Iterator<T> it, bool chage_size_flag)
  {
    //it                  - итерратор, который добавляем.


    if (_Begin_Element_ref != null)
    {
      //Значит уже есть минимум один добавленный элемент.

      it._prev       =_Last_Element_ref;  //Указываем для нового эелмента ссылку на предыдущи элементй, то есть это последний элемент до вызова "push_back"
      _Last_Element_ref!._next = it;      //Указываем для предыдущего элементы ссылку на "next" на этот только что доавленный элемент. "!" - указывает компилятору, что "Last_Element_ref" точно не Null, иначе не хера не компилируется. Повыдумывают всякой хни.

      _Last_Element_ref        = it;      //Теперь ссылка на последний элемент - это этот добавленный элемент.

      if(chage_size_flag == true){_Size++;}

      return;
    }
    else
    {
      //Значит еще нет ни одного доавбленного элемента.

      _Begin_Element_ref = it;
      _Last_Element_ref  = _Begin_Element_ref;

      if(chage_size_flag == true){_Size++;}

      return;
    }

  }

  void _push_front_iterrator(STD_LIST_Iterator<T> it, bool chage_size_flag)
  {
    //it                  - итерратор, который добавляем.

    if (_Begin_Element_ref != null)
    {
      //Значит уже есть минимум один добавленный элемент.

      it._next                    = _Begin_Element_ref;   //Указываем для нового эелмента ссылку на следующий элементй, то есть это первый элемент в списке.
      _Begin_Element_ref!._prev   = it;                   //Указываем для первого элемента ссылку на его теперешний предыдущий "prev" - только что доавленный элемент. "!" - указывает компилятору, что "Last_Element_ref" точно не Null, иначе не хера не компилируется. Повыдумывают всякой хни.

      _Begin_Element_ref          = it;                    //Теперь ссылка на первый элемент - это этот добавленный элемент.

      if(chage_size_flag == true){_Size++;}

      return;
    }
    else
    {
      //Значит еще нет ни одного доавбленного элемента.

      _Begin_Element_ref = it;
      _Last_Element_ref  = _Begin_Element_ref;

      if(chage_size_flag == true){_Size++;}

      return;
    }

  }

  STD_LIST_Iterator<T> _insert_iterrator(STD_LIST_Iterator<T> Iterrator_to_Elem, insert_flag insert_flag_, STD_LIST_Iterator<T> it, bool chage_size_flag)
  {
    //Iterrator_to_Elem   - ссылка на уже добавленный и существуюший элемент в Списке.
    //insert_flag_        - флаг добавления: before - значит доавбить элемент "value" ДО элемента "Iterrator_to_Elem" в списке; after - значит доавбить элемент "value" ПОСЛЕ элемента "Iterrator_to_Elem" в списке.
    //it                  - итерратор, который добавляем.


    if(insert_flag_ == insert_flag.Before)
    {
      //Значит нужно вставить элемент "value" ДО элемента "Iterrator_to_Elem" в списке.

      if (_Size == 1)
      {
        //Значит это едисвенный элемент в списке:

        _push_front_iterrator(it, chage_size_flag);

        return it;
      }
      else
      {
        //Значит в списке минимум два элемента:

        if(Iterrator_to_Elem._prev == null)
        {
          //Значит это первый элемент в списке:

          _push_front_iterrator(it, chage_size_flag);

          return it;
        }
        else
        {

          //[Iterrator_to_Elem._prev]...[Iterrator_to_Elem]                                      //Текущие два элементуса
          //[Iterrator_to_Elem._prev]...<insert__temp_element__insert>...[Iterrator_to_Elem]     //Вставляем элемент "temp_element" между этими элементами, то есть ДО элмента "Iterrator_to_Elem"

          //---------------------------------------------------
          it._next = Iterrator_to_Elem;
          it._prev = Iterrator_to_Elem._prev;

          (Iterrator_to_Elem._prev)!._next = it;

          Iterrator_to_Elem._prev = it;
          //---------------------------------------------------

          if(chage_size_flag == true){_Size++;}

          return it;
        }

      }

    }
    else
    {
      //if(insert_flag_ == insert_flag.After)

      //Значит нужно вставить элемент "value" ПОСЛЕ элемента "Iterrator_to_Elem" в списке.

      if (_Size == 1)
      {
        //Значит это едисвенный элемент в списке:

        _push_back_iterrator(it, chage_size_flag);

        return it;
      }
      else
      {
        //Значит в списке минимум два элемента:

        if(Iterrator_to_Elem._next == null)
        {
          //Значит это последний элемент в списке:

          _push_back_iterrator(it, chage_size_flag);

          return it;
        }
        else
        {

          //[Iterrator_to_Elem]...[Iterrator_to_Elem._prev]                                      //Текущие два элементуса
          //[Iterrator_to_Elem]...<insert__temp_element__insert>...[Iterrator_to_Elem._next]     //Вставляем элемент "temp_element" между этими элементами, то есть ДО элмента "Iterrator_to_Elem"

          //---------------------------------------------------
          it._next = Iterrator_to_Elem._next;
          it._prev = Iterrator_to_Elem;

          (Iterrator_to_Elem._next)!._prev = it;

          Iterrator_to_Elem._next          = it;
          //---------------------------------------------------

          if(chage_size_flag == true){_Size++;}

          return it;
        }
      }
    }

  }
  STD_LIST_Iterator<T> _insert_iterrator_range(STD_LIST_Iterator<T> Iterrator_to_Elem, insert_flag insert_flag_, STD_LIST_Iterator<T> First_Range_it, STD_LIST_Iterator<T> Last_Range_it, bool chage_size_flag)
  {
    //Iterrator_to_Elem   - ссылка на уже добавленный и существуюший элемент в Списке.
    //insert_flag_        - флаг добавления: before - значит доавбить элемент "value" ДО элемента "Iterrator_to_Elem" в списке; after - значит доавбить элемент "value" ПОСЛЕ элемента "Iterrator_to_Elem" в списке.


    //--------------------------------
    if(First_Range_it == Last_Range_it)
    {
      return _insert_iterrator(Iterrator_to_Elem, insert_flag_, First_Range_it, chage_size_flag);
    }
    else
    {
      if (insert_flag_ == insert_flag.Before)
      {
        if(Iterrator_to_Elem._prev == null)
        {
          //Значит вставляем диапазон итераторов от начала ДО "Iterrator_to_Elem":

          _Begin_Element_ref        = First_Range_it;
          _Begin_Element_ref!._prev = null;

          Last_Range_it._next       = Iterrator_to_Elem;
          Iterrator_to_Elem._prev   = Last_Range_it;
        }
        else
        {
          //Значит вставляем диапазон итераторов в "середину" списка ДО "Iterrator_to_Elem":

          (Iterrator_to_Elem._prev)!._next = First_Range_it;
          First_Range_it._prev             = Iterrator_to_Elem._prev;

          Iterrator_to_Elem._prev          = Last_Range_it;
          Last_Range_it._next              = Iterrator_to_Elem;
        }
      }
      else
      {
        if(Iterrator_to_Elem._next == null)
        {
          //Значит вставляем диапазон итераторов ПОСЛЕ последнего элемента "Iterrator_to_Elem" в списке:

          _Last_Element_ref        = Last_Range_it;
          _Last_Element_ref!._next = null;

          First_Range_it._prev      = Iterrator_to_Elem;
          Iterrator_to_Elem._next   = First_Range_it;
        }
        else
        {
          //Значит вставляем диапазон итераторов в "середину" списка ПОСЛЕ "Iterrator_to_Elem":

          (Iterrator_to_Elem._next)!._prev  = Last_Range_it;
          Last_Range_it._next               = Iterrator_to_Elem._next;

          Iterrator_to_Elem._next           = First_Range_it;
          First_Range_it._prev              = Iterrator_to_Elem;
        }
      }

      //----------------------------------------
      if(chage_size_flag == true)
      {
        int count = range_iterrator_count(First_Range_it, Last_Range_it);  //Получим кол-во элементов в диапазоне итераторов First-Last.

        _Size = _Size + count;
      }
      //----------------------------------------

      return First_Range_it;

    }
  }




  STD_LIST_Iterator<T>? _erase_iterrator(STD_LIST_Iterator<T> Iterrator_to_Elem, bool chage_size_flag)
  {

    //Функция возвращает итератор на следющий элемент за удалнным элементом.

    if(Iterrator_to_Elem!._next == null)
    {
      //Значит это Последний элемент в списке.

      pop_back();   //Удаляем Последний элемент.

      return null;   //Возвращем null, так как "После" удаленного элемента ничего нет - так как он был послденим.
    }
    else
    {
      if(Iterrator_to_Elem!._prev == null)
      {
        //Значит это Первый элемент в списке.

        pop_front();      //Удаляем Последний элемент.

        return _Begin_Element_ref;   //Возвращаем "итерраотр" на первый элемент, так элемент, который следовал за Удаляемым элементом - теперь стал первым.
      }
      else
      {
        //Значит это Ни Первый и Не Последний элемент в списке.

        //-----------------------------------------------------------------
        final STD_LIST_Iterator<T> removed_Element = Iterrator_to_Elem;           // Сохраняем ссылку на удаляемый элемент, чтобы обнулить его связи
        final STD_LIST_Iterator<T> return_Element  = Iterrator_to_Elem._next!;    // Сохраняем ссылку на Следующий за удаляемым элементом, для его возврата из функции.
        //-----------------------------------------------------------------


        //---------------------------------------------------------------
        (Iterrator_to_Elem!._next)!._prev = Iterrator_to_Elem._prev;

        (Iterrator_to_Elem!._prev)!._next = Iterrator_to_Elem._next;
        //---------------------------------------------------------------


        //----------------------------------
        if(chage_size_flag == true)
        {
          removed_Element._next = null;
          removed_Element._prev = null;

          _Size = _Size - 1;
        }
        //----------------------------------

        return return_Element;
      }
    }

  }
  STD_LIST_Iterator<T>? _erase_iterrator_Range(STD_LIST_Iterator<T> First_Range_it, STD_LIST_Iterator<T> Last_Range_it, bool chage_size_flag)
  {

    //Функция возвращает итератор на следющий элемент за последним удалнным элементом диапазона.


    //----------------------------------------------
    if(First_Range_it == Last_Range_it)
    {
      return _erase_iterrator(First_Range_it, chage_size_flag);
    }
    //----------------------------------------------



    //----------------------------------------------
    if(First_Range_it._prev == null && Last_Range_it._next == null)
    {
      //Значит весь диапазон списка:

      _clear(chage_size_flag);

      return null;
    }
    else
    {
      if(First_Range_it._prev == null && Last_Range_it._next != null)
      {
        //Значит от Первого элемента до "Середины":

        //------------------------------------------
        _Begin_Element_ref = Last_Range_it._next;
        _Begin_Element_ref!._prev = null;
        //------------------------------------------


        STD_LIST_Iterator<T> temp_it      = First_Range_it;
        STD_LIST_Iterator<T> temp_it_next;


        //----------------------------------------
        if(chage_size_flag == true)
        {
          int count = range_iterrator_count(First_Range_it, Last_Range_it);  //Получим кол-во элементов в диапазоне итераторов First-Last.

          _Size = _Size - count;
        }
        //----------------------------------------

        for(;;)
        {
          temp_it_next = temp_it._next!;

          //------------------------
          if(chage_size_flag == true)
          {
            temp_it._prev = null;
            temp_it._next = null;
          }
          //------------------------

          if(temp_it_next == Last_Range_it)
          {
            //Значит это "Last_Range_it":

            //------------------------
            if(chage_size_flag == true)
            {
              temp_it_next._prev = null;
              temp_it_next._next = null;
            }
            //------------------------

            return _Begin_Element_ref;
          }

          temp_it = temp_it_next;
        }

      }
      else
      {
        if(First_Range_it._prev != null && Last_Range_it._next == null)
        {
          //Значит от "Середины" до Последнего элемента:


          //------------------------------------------
          _Last_Element_ref = First_Range_it._prev;
          _Last_Element_ref!._next = null;
          //------------------------------------------

          STD_LIST_Iterator<T> temp_it      = First_Range_it;
          STD_LIST_Iterator<T> temp_it_next;


          //----------------------------------------
          if(chage_size_flag == true)
          {
            int count = range_iterrator_count(First_Range_it, Last_Range_it);  //Получим кол-во элементов в диапазоне итераторов First-Last.

            _Size = _Size - count;
          }
          //----------------------------------------


          for(;;)
          {
            temp_it_next = temp_it._next!;

            //------------------------
            if(chage_size_flag == true)
            {
              temp_it._prev = null;
              temp_it._next = null;
            }
            //------------------------

            if(temp_it_next == Last_Range_it)
            {
              //Значит это "Last_Range_it":

              //------------------------
              if(chage_size_flag == true)
              {
                temp_it_next._prev = null;
                temp_it_next._next = null;
              }
              //------------------------

              return null;
            }

            temp_it = temp_it_next;
          }

        }
        else
        {
          //Значит Первый и Последний элементы не затрагиваются: то есть удаляем кусок из "Середины":

          //------------------------------------------
          (First_Range_it._prev!)._next      = Last_Range_it._next;
          (Last_Range_it._next!)._prev       = First_Range_it._prev;

          STD_LIST_Iterator<T> it_for_return = Last_Range_it._next!;
          //------------------------------------------

          STD_LIST_Iterator<T> temp_it      = First_Range_it;
          STD_LIST_Iterator<T> temp_it_next;

          for(;;)
          {
            temp_it_next = temp_it._next!;

            //------------------------
            if(chage_size_flag == true)
            {
              temp_it._prev = null;
              temp_it._next = null;
            }
            //------------------------

            if(temp_it_next == Last_Range_it)
            {
              //Значит это "Last_Range_it":

              //------------------------
              if(chage_size_flag == true)
              {
                temp_it_next._prev = null;
                temp_it_next._next = null;
              }
              //------------------------

              //----------------------------------------
              if(chage_size_flag == true)
              {
                int count = range_iterrator_count(First_Range_it, Last_Range_it);  //Получим кол-во элементов в диапазоне итераторов First-Last.

                _Size = _Size - count;
              }
              //----------------------------------------

              return it_for_return;
            }

            temp_it = temp_it_next;
          }

        }
      }

    }
    //----------------------------------------------

  }

  void _clear(bool chage_size_flag)
  {

    if(chage_size_flag == true)
    {

      //--------------------------------------
      if(_Size == 1)
      {
        _Begin_Element_ref!._prev = null;
        _Begin_Element_ref!._next = null;

        _Begin_Element_ref = null;
        _Last_Element_ref  = null;

        _Size = 0;
        
        return;
      }
      //--------------------------------------


      STD_LIST_Iterator<T>? temp_it      = _Begin_Element_ref;
      STD_LIST_Iterator<T>? temp_it_next;


      for(;;)
      {

        temp_it_next = temp_it!._next;

        //------------------------
        temp_it._prev = null;
        temp_it._next = null;
        //------------------------

        if (temp_it_next == _Last_Element_ref)
        {
          //Значит это Последний элемент:

          //------------------------
          temp_it_next!._prev = null;
          temp_it_next!._next = null;
          //------------------------

          break;
        }

        temp_it = temp_it_next;
      }

      _Begin_Element_ref = null;
      _Last_Element_ref  = null;

      _Size = 0;
    }
    else
    {
      _Begin_Element_ref!._prev = null;
      _Begin_Element_ref!._next = null;

      _Begin_Element_ref = null;
      _Last_Element_ref  = null;
    }


  }

}


