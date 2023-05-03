import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Дополнительно',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(children: [
        OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: const [
                          Text(
                            "Политика безопасности",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            """1. Защита личной информации: Мы стремимся обеспечить безопасность и конфиденциальность личной информации наших клиентов, такой как их имя, адрес, электронная почта и данные о платежах. Мы собираем, храним и обрабатываем эти данные только для выполнения заказов и предоставления услуг, а также для связи с нашими клиентами по важным вопросам, связанным с нашими продуктами и услугами.
                                      
2. Защита от взлома и кибератак: Мы принимаем меры для защиты наших систем и данных от взломов и кибератак. Мы постоянно обновляем наши системы безопасности, используем защищенные протоколы передачи данных и мониторим наши системы для быстрого обнаружения и устранения уязвимостей.
                                      
3. Конфиденциальность покупок: Мы используем защищенные методы оплаты, такие как шифрование данных и безопасные платежные шлюзы, чтобы обеспечить конфиденциальность и безопасность платежей наших клиентов.
                                      
4. Ограниченный доступ: Мы ограничиваем доступ к личной информации наших клиентов только тем сотрудникам, которые обязаны иметь к ним доступ для выполнения своих обязанностей. Все наши сотрудники обязаны соблюдать политику конфиденциальности.
5. Обязательства сторонних поставщиков: Мы работаем только с надежными сторонними поставщиками услуг, которые обязаны соблюдать наши требования по безопасности и конфиденциальности.""",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: SizedBox(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.policy,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Политика конфиенциальности",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )
                  ]),
            )),
        OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: const [
                          Text(
                            "Условия пользования",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            """1.Лицензия на использование: Предоставляемая вам онлайн-книга является объектом авторского права, и мы предоставляем вам ограниченную, неисключительную, непередаваемую лицензию на ее использование в соответствии с условиями настоящего соглашения.

2.Запрет на распространение: Вы не имеете права распространять, продавать или иным образом передавать онлайн-книгу третьим лицам без предварительного согласия правообладателя.

3.Использование только для личных целей: Вы можете использовать онлайн-книгу только для личных целей и не имеете права использовать ее в коммерческих целях.

4.Ограничения на копирование и изменение: Вы не имеете права копировать, модифицировать или изменять онлайн-книгу, за исключением тех случаев, когда это разрешено вами самостоятельно.

5.Ответственность за ущерб: Мы не несем ответственности за любой ущерб, причиненный вам или вашим устройствам при использовании онлайн-книги.

6.Право на прекращение лицензии: Мы имеем право прекратить вашу лицензию на использование онлайн-книги в любое время, если вы нарушаете настоящее соглашение.

7.Конфиденциальность и безопасность: Мы защищаем вашу личную информацию и соблюдаем политику безопасности, чтобы обеспечить конфиденциальность вашей информации при использовании нашей онлайн-книги.

8,Изменения в условиях: Мы имеем право изменять настоящее соглашение в любое время без предварительного уведомления вас. Новые условия вступают в силу немедленно после их публикации на нашем сайте.""",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: SizedBox(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.document_scanner,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Условия пользования",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )
                  ]),
            )),
        const SizedBox(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey, // Text Color (Foreground color)
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Выйти",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}
