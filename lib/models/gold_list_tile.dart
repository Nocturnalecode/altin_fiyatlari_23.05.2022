/* Card(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/calculate",
              arguments: ScreenArguments(gold.alis, gold.satis));
        },
        title: Text("ALIŞ: " + gold.alis + " TL"),
        subtitle: Text("SATIŞ: " + gold.satis + " TL"),
        leading: SizedBox(
          height: 60,
          width: 75,
          child: Column(
            children: [
              Expanded(flex: 1, child: Image.asset("images/gold.jpg")),
              Expanded(
                  flex: 1,
                  child: Text(
                    UIHelper.getStringFromString(gold.type),
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
        trailing: SizedBox(
          height: 70,
          width: 70,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text("%" + gold.degisim,
                      style: const TextStyle(fontSize: 14))),
              Expanded(
                  flex: 1,
                  child: Image.asset(getValueChangeStatus(gold.degisim)))
            ],
          ),
        ),
      ),
    ); */