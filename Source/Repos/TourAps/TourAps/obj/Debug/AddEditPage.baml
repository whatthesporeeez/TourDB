   M S B A M L   `   `   `  ����B  >TourAps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:TourApsTourAps  5          TourAps.AddEditPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:TourAps     5        N� Title$  AddEditPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��Название��6   $��Center=�6$   $��Center=�6A   $��34(�6\   6m   �� 5   
   $%��Количество звезд��6   $��1��6-   $��Center=�6:   $��Center=�6W   $��20(�6r   6�   �� 5   
   $��Страна��6   $��2��6"   $��Center=�6/   $��Center=�6L   $��34(�6g   6w   �� 5   
    �� 	MaxLength$	 100��6(   $��1��68   ��6   �� *Name+6J   �� 5   
   $ 2��60   $��1��6>   $��1��6N   $	��175��6[   $
��Left=�6g   ��6   �� *CountOfStars+6�   �� 5   
   -   5         ��Name$ ComboCountries��5   Q   $��2��64   $��1��6A    �� DisplayMemberPath$
 Name��6i    �� SelectedItem 6   �� *	Country+6�   �� 5   
   -   5        $��BtnSave��5   F   $��Сохранить��6   $��2��6%   $��4��69   6m   5      5      