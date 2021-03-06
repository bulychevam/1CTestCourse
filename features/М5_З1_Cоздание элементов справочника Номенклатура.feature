#language: ru

@tree

Функционал: Cоздание элементов справочника Номенклатура

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание элементов справочника Номенклатура
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	И Я запоминаю значение выражения '0' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар " + $Шаг$' в переменную "НаименованиеНоменклатуры"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                                 | 'ItemType'                                                          | 'Unit'                                                          | 'Description_en'             |
		| '{!"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID,  "-", "")}' | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | '$НаименованиеНоменклатуры$' |
		
				