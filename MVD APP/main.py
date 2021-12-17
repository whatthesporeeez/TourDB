from PyQt5 import QtWidgets,QtGui,QtCore
from pymysql import connections , cursors

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()

        self.widget_main = QtWidgets.QWidget()

        lay_verticaL = QtWidgets.QVBoxLayout(self.widget_main)
        lay_horizontal = QtWidgets.QHBoxLayout()


        text_name = QtWidgets.QLabel('МВД')
        but_othets = QtWidgets.QPushButton('Отчеты')
        but_othets.clicked.connect(self.othet)
        but_forms = QtWidgets.QPushButton('Формы')
        but_forms.clicked.connect(self.forms)

        lay_verticaL.addWidget(text_name,alignment=QtCore.Qt.AlignCenter)
        lay_horizontal.addWidget(but_othets)
        lay_horizontal.addWidget(but_forms)
        lay_verticaL.addLayout(lay_horizontal)



        self.setCentralWidget(self.widget_main)
        self.resize(800,600)
        self.show()
        self.zastavka()
    def othet(self):
        self.othet_win = QtWidgets.QMainWindow()
        self.widget_othet = QtWidgets.QWidget()
        self.lay_othet = QtWidgets.QVBoxLayout(self.widget_othet)

        self.but_1 = QtWidgets.QPushButton('Фильтры для отображения сотрудников отдельных должностей')
        self.but_1.clicked.connect(self.zapros_1)
        self.text_1 = QtWidgets.QLabel('')

        self.but_2 = QtWidgets.QPushButton('Фильтры для отображения сотрудников отдельных званий')
        self.but_2.clicked.connect(self.zapros_2)
        self.text_2 = QtWidgets.QLabel('')

        self.but_3 = QtWidgets.QPushButton('Фильтры для отображения преступников по видам преступлений')
        self.but_3.clicked.connect(self.zapros_3)
        self.text_3 = QtWidgets.QLabel('')

        self.but_4 = QtWidgets.QPushButton('Фильтры для отображения преступников по состоянию')
        self.but_4.clicked.connect(self.zapros_4)
        self.text_4 = QtWidgets.QLabel('')


        self.but5 = QtWidgets.QPushButton('Таблицы')
        self.but5.clicked.connect(self.tables)

        self.lay_othet.addWidget(self.but_1)
        self.lay_othet.addWidget(self.text_1)
        self.lay_othet.addWidget(self.but_2)
        self.lay_othet.addWidget(self.text_2)
        self.lay_othet.addWidget(self.but_3)
        self.lay_othet.addWidget(self.text_3)
        self.lay_othet.addWidget(self.but_4)
        self.lay_othet.addWidget(self.text_4)
        self.lay_othet.addWidget(self.but5)
        scroll = QtWidgets.QScrollArea()
        scroll.setWidget(self.widget_othet)
        scroll.setWidgetResizable(True)
        self.othet_win.setCentralWidget(scroll)
        self.othet_win.resize(800,600)
        self.othet_win.show()

    def zapros_1(self):
        with connections.Connection(user='root',password='',database='mvd',host='localhost') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT `fio`,`cod_position` FROM `employee`')
                cursor.execute(sql)
                self.text_1.setText(str(cursor.fetchall()))

    def zapros_2(self):
        with connections.Connection(user='root', password='', database='mvd', host='localhost') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT `fio`, `cod_rank` FROM `employee`')
                cursor.execute(sql)
                self.text_2.setText(str(cursor.fetchall()))
    def zapros_3(self):
        with connections.Connection(user='root', password='', database='mvd', host='localhost') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT `fio`, `cod_type_of_crime` FROM `criminals`')
                cursor.execute(sql)
                self.text_3.setText(str(cursor.fetchall()))

    def zapros_4(self):
        with connections.Connection(user='root', password='', database='mvd', host='localhost') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT `fio`, `condition` FROM `criminals`')
                cursor.execute(sql)
                self.text_4.setText(str(cursor.fetchall()))

    def forms(self):
        self.win_about_programm = QtWidgets.QMainWindow()
        self.widget_about_programm = QtWidgets.QWidget()

        self.but_about_programm = QtWidgets.QPushButton('О программе')
        self.but_about_programm.clicked.connect(self.ab_1)
        self.text_1_1 = QtWidgets.QLabel('')

        self.zastavka_but = QtWidgets.QPushButton('Заставка')
        self.zastavka_but.clicked.connect(self.zastavka)

        lay = QtWidgets.QVBoxLayout(self.widget_about_programm)
        lay.addWidget(self.but_about_programm)
        lay.addWidget(self.text_1_1)
        lay.addWidget(self.zastavka_but)

        self.win_about_programm.setCentralWidget(self.widget_about_programm)
        self.win_about_programm.resize(800, 600)
        self.win_about_programm.show()

    def tables(self):
        self.win_table = QtWidgets.QMainWindow()
        self.widget_table = QtWidgets.QWidget()

        self.lay_grid_tables = QtWidgets.QGridLayout(self.widget_table)

        self.table_1 = QtWidgets.QTableWidget()
        self.table_1.setColumnCount(9)
        self.table_1.setRowCount(len(self.get_info_criminals()))
        self.table_1.setHorizontalHeaderLabels(['case_number', 'fio', 'date_of_birth', 'gender', 'adres', 'cod_type_of_crime','cod_victim','condition','code_employee'])
        self.table_1.setFixedSize(600, 150)
        self.but_table_1 = QtWidgets.QPushButton('Обновить criminals')
        self.but_table_1.clicked.connect(self.update_criminals)

        self.table_2 = QtWidgets.QTableWidget()
        self.table_2.setColumnCount(9)
        self.table_2.setRowCount(len(self.get_info_employee()))
        self.table_2.setHorizontalHeaderLabels(['cod_employee', 'fio', 'age', 'gender', 'adres', 'phone','passport','cod_position','cod_rank'])
        self.table_2.setFixedSize(600, 150)
        self.but_table_2 = QtWidgets.QPushButton('Обновить employee')
        self.but_table_2.clicked.connect(self.update_employee)

        self.table_3 = QtWidgets.QTableWidget()
        self.table_3.setColumnCount(5)
        self.table_3.setRowCount(len(self.get_info_positions()))
        self.table_3.setHorizontalHeaderLabels(['cod_position', 'name_position', 'oklad', 'responsibilities', 'requirements'])
        self.table_3.setFixedSize(600, 150)
        self.but_table_3 = QtWidgets.QPushButton('Обновить poseitions')
        self.but_table_3.clicked.connect(self.update_positions)

        self.table_4 = QtWidgets.QTableWidget()
        self.table_4.setColumnCount(5)
        self.table_4.setRowCount(len(self.get_info_ranks()))
        self.table_4.setHorizontalHeaderLabels(['cod_rank', 'name_rank', 'allowance', 'responsibilities', 'requirements'])
        self.table_4.setFixedSize(600, 150)
        self.but_table_4 = QtWidgets.QPushButton('Обновить ranks')
        self.but_table_4.clicked.connect(self.update_ranks)

        self.table_5 = QtWidgets.QTableWidget()
        self.table_5.setColumnCount(5)
        self.table_5.setRowCount(len(self.get_info_types_of_crimes()))
        self.table_5.setHorizontalHeaderLabels(['cod_type_of_crime', 'name_crime', 'Article', 'punishment', 'Term'])
        self.table_5.setFixedSize(600, 150)
        self.but_table_5 = QtWidgets.QPushButton('Обновить crimes')
        self.but_table_5.clicked.connect(self.update_types_of_crimes)

        self.table_6 = QtWidgets.QTableWidget()
        self.table_6.setColumnCount(5)
        self.table_6.setRowCount(len(self.get_info_victims()))
        self.table_6.setHorizontalHeaderLabels(['cod_victims', 'fio', 'date_of_birth', 'gender', 'adres'])
        self.table_6.setFixedSize(600, 150)
        self.but_table_6 = QtWidgets.QPushButton('Обновить Victims')
        self.but_table_6.clicked.connect(self.update_victims)


        self.lay_grid_tables.addWidget(self.table_1,0,0)
        self.lay_grid_tables.addWidget(self.but_table_1,0,1)

        self.lay_grid_tables.addWidget(self.table_2,1,0)
        self.lay_grid_tables.addWidget(self.but_table_2, 1, 1)

        self.lay_grid_tables.addWidget(self.table_3,2,0)
        self.lay_grid_tables.addWidget(self.but_table_3, 2, 1)

        self.lay_grid_tables.addWidget(self.table_4,3,0)
        self.lay_grid_tables.addWidget(self.but_table_4, 3, 1)

        self.lay_grid_tables.addWidget(self.table_5,4,0)
        self.lay_grid_tables.addWidget(self.but_table_5, 4, 1)

        self.lay_grid_tables.addWidget(self.table_6,5,0)
        self.lay_grid_tables.addWidget(self.but_table_6, 5, 1)

        scroll = QtWidgets.QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setWidget(self.widget_table)
        self.win_table.setCentralWidget(scroll)
        self.win_table.resize(800, 600)
        self.win_table.show()


####criminals
    def get_info_criminals(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `criminals`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_criminals(self):
        for i in range(0,len(self.get_info_criminals())):
            for g in range(0,9):
                f = str(self.get_info_criminals()[i][g])

                self.table_1.setItem(i,g,QtWidgets.QTableWidgetItem(f))
    ###employee
    def get_info_employee(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `employee`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_employee(self):
        for i in range(0,len(self.get_info_employee())):
            for g in range(0,9):
                f = str(self.get_info_employee()[i][g])

                self.table_2.setItem(i,g,QtWidgets.QTableWidgetItem(f))

    ###positions
    def get_info_positions(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `positions`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_positions(self):
        for i in range(0,len(self.get_info_positions())):
            for g in range(0,5):
                f = str(self.get_info_positions()[i][g])

                self.table_3.setItem(i,g,QtWidgets.QTableWidgetItem(f))
    ##ranks
    def get_info_ranks(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `ranks`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_ranks(self):
        for i in range(0,len(self.get_info_ranks())):
            for g in range(0,5):
                f = str(self.get_info_ranks()[i][g])

                self.table_4.setItem(i,g,QtWidgets.QTableWidgetItem(f))
####types_of_crimes
    def get_info_types_of_crimes(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `types_of_crimes`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_types_of_crimes(self):
        for i in range(0,len(self.get_info_types_of_crimes())):
            for g in range(0,5):
                f = str(self.get_info_types_of_crimes()[i][g])

                self.table_5.setItem(i,g,QtWidgets.QTableWidgetItem(f))

    ###victims
    def get_info_victims(self):
        with connections.Connection(user='root', host='localhost', database='mvd') as bd:
            with cursors.Cursor(bd) as cursor:
                sql = ('SELECT * FROM `victims`')
                cursor.execute(sql)
                g = cursor.fetchall()

            return g


    def update_victims(self):
        for i in range(0,len(self.get_info_victims())):
            for g in range(0,5):
                f = str(self.get_info_victims()[i][g])

                self.table_6.setItem(i,g,QtWidgets.QTableWidgetItem(f))


    def ab_1(self):
        self.text_1_1.setText('Программа разработана: Антоном Збаровским')

    def zastavka(self):
        self.win_zastavka = QtWidgets.QMainWindow()
        self.widget_zastavka = QtWidgets.QWidget()

        text = QtWidgets.QLabel('Добро пожаловать в МВД')

        lay = QtWidgets.QVBoxLayout(self.widget_zastavka)
        lay.addWidget(text)


        self.win_zastavka.setCentralWidget(self.widget_zastavka)
        self.win_zastavka.resize(800,600)
        self.win_zastavka.show()

app = QtWidgets.QApplication([])

win = MainWindow()
app.exec()