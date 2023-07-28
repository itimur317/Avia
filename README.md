# Aviasales

Архитектура — **MVVM**

- Темная тема

- Парсинг с использованием DTO-моделей и completion handler

При запуске приложения отправляется запрос с информацией о городах вылета и прилета. В результате парсинга (SearchResult) собирается вью поисковой выдачи: заголовок + список с описанием каждого рейса. Для парсинга рейса используется модель FlightDetails, а для дальнейшей работы, в том числе сборки элементов выдачи и деталей рейса, используются элементы SearchResult — SearchResultItem. Необходимость создать элемент SearchResultItem состоит в том, что FlightDetails не содержит информации о городах, количестве билетов и является ли билет самым дешевым. 

Для удобства было решено SearchResult наследовать от протокола Sequence, где в качестве элементов использовались SearchResultItem (код ниже). Это позволило итерироваться по SearchResult и сразу же генерировать массив элементов поиска, что оказалось удобным решением при обработке моделей после парсинга и создании вью.

```swift
SearchResult.Element: SearchResultItem
```

<img src="https://github.com/itimur317/Avia/assets/56135499/7b69e632-693c-4fde-8d48-90df2dbd2709.png" width=24% height=22%>
<img src="https://github.com/itimur317/Avia/assets/56135499/e9ea6ef0-a650-409b-8f2c-fcb8f25444dc.png" width=24% height=22%>
<img src="https://github.com/itimur317/Avia/assets/56135499/f7b78a1b-68b8-4b40-9001-2e86b8ddbf59.png" width=24% height=22%>
<img src="https://github.com/itimur317/Avia/assets/56135499/47df63ab-cd9d-494d-9c75-d67ae9682d41.png" width=24% height=22%>
