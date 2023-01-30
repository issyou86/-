// C++ code
//
#include <Adafruit_LiquidCrystal.h>
long randNumber; //乱数変数
long cnt = 0; //回転数
long coin = 0;//枚数
int Bcount = 0;//BIG回数
int Rcount = 0;//REG回数
Adafruit_LiquidCrystal lcd_1(0);

void setup()
{
  //固定表示
  lcd_1.begin(16, 2);
  lcd_1.setCursor(0, 0);
  lcd_1.print("BIG");
  lcd_1.setCursor(5, 0);
  lcd_1.print("REG");
  lcd_1.setCursor(10, 0);
  lcd_1.print("S");
  lcd_1.setCursor(0, 1);
}

void loop()
{
  lcd_1.setCursor(0, 1);
  lcd_1.print("                ");
  
  randNumber = random(1, 65536);//乱数
  if(168 >= randNumber){//単独BIG
  	lcd_1.setCursor(0, 1);
    lcd_1.print("777");
    coin += 325;
    Bcount +=1;
   // delay(5000);
  }else if(240 >= randNumber){//チェリー+BIG
	lcd_1.setCursor(0, 1);
    lcd_1.print("C777");
    coin+= 327;
    Bcount +=1;
    //delay(5000);
  }else if(387 >= randNumber){//単独REG
  	lcd_1.setCursor(0, 1);
    lcd_1.print("77B");
    coin+= 104;
    Rcount +=1;
    //delay(5000);
  }else if(459 >= randNumber){//チェリーREG
    lcd_1.setCursor(0, 1);
    lcd_1.print("C77B");
    coin += 106;
    Rcount +=1;
    //delay(5000);
  }else if(9439 >= randNumber){//リプレイ
  	lcd_1.setCursor(0, 1);
    lcd_1.print("REP");
    coin+= 3;
    //delay(500);
  }else if(11293 >= randNumber){//チェリー
    lcd_1.setCursor(0, 1);
    lcd_1.print("Cherry");
    coin += 2;
    //delay(500);
  }else if(21393 >= randNumber){//ブドウ
    lcd_1.setCursor(0, 1);
    lcd_1.print("Grapes");
    coin += 7;
   // delay(500);
  }else if(21453 >= randNumber){//ベル
    lcd_1.setCursor(0, 1);
    lcd_1.print("Bell");
    coin += 14;
    //delay(3000);
  }else{//はずれ
    lcd_1.setCursor(0, 1);
    lcd_1.print("HAZURE");
  	coin -= 3;
  }
    //大当たり回数表示
    lcd_1.setCursor(3, 0);
    lcd_1.print(Bcount);
    lcd_1.setCursor(8, 0);
    lcd_1.print(Rcount);

    lcd_1.setCursor(12, 1);
  	lcd_1.print(coin);//コイン所持数

  	cnt += 1;//回転数追加
  	lcd_1.setCursor(11, 0);
  	lcd_1.print(cnt);//回転数表示
  	delay(10);
}
