package org.casalib.util
{
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import flash.xml.XMLNodeType;
   
   public class StringUtil
   {
      
      public static const WHITESPACE:String = " \t\n\r";
      
      public static var SMALL_WORDS:Array = new Array("a","an","and","as","at","but","by","en","for","if","is","in","of","on","or","the","to","v","via","vs");
       
      
      public function StringUtil()
      {
         super();
      }
      
      public static function truncate(param1:String, param2:uint, param3:uint = 0, param4:String = "") : String
      {
         var _loc5_:String = param1.substr(0,param3);
         var _loc6_:String = param1.substr(-param2,param2);
         return _loc5_ + param4 + _loc6_;
      }
      
      public static function toTitleCase(param1:String, param2:Boolean = true) : String
      {
         var _loc5_:int = 0;
         param1 = StringUtil._checkWords(param1," ",true,param2);
         var _loc3_:Array = param1.split(" ");
         var _loc4_:int = _loc3_.length - 1;
         if(!StringUtil._isIgnoredWord(_loc3_[0]))
         {
            _loc3_[0] = StringUtil._capitalizeFirstLetter(_loc3_[0]);
         }
         if(!StringUtil._isIgnoredWord(_loc3_[_loc4_]) && (!param2 || !StringUtil._isSmallWord(_loc3_[_loc4_])))
         {
            _loc3_[_loc4_] = StringUtil._capitalizeFirstLetter(_loc3_[_loc4_]);
         }
         param1 = _loc3_.join(" ");
         if(StringUtil.contains(param1,": "))
         {
            _loc5_ = -1;
            _loc3_ = param1.split(": ");
            while(++_loc5_ < _loc3_.length)
            {
               _loc3_[_loc5_] = StringUtil._capitalizeFirstLetter(_loc3_[_loc5_]);
            }
            param1 = _loc3_.join(": ");
         }
         return param1;
      }
      
      protected static function _checkWords(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : String
      {
         var _loc7_:String = null;
         var _loc5_:Array = param1.split(param2);
         var _loc6_:int = _loc5_.length;
         while(_loc6_--)
         {
            _loc7_ = _loc5_[_loc6_];
            _loc5_[_loc6_] = StringUtil._checkWord(_loc7_,param3,param4);
         }
         return _loc5_.join(param2);
      }
      
      protected static function _checkWord(param1:String, param2:Boolean, param3:Boolean) : String
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         if(StringUtil._isIgnoredWord(param1))
         {
            return param1;
         }
         if(param3)
         {
            if(StringUtil._isSmallWord(param1))
            {
               return param1.toLowerCase();
            }
         }
         if(param2)
         {
            _loc4_ = new Array("-","–","—");
            _loc5_ = -1;
            while(++_loc5_ < _loc4_.length)
            {
               if(StringUtil.contains(param1,_loc4_[_loc5_]) != 0)
               {
                  param1 = StringUtil._checkWords(param1,_loc4_[_loc5_],false,true);
                  _loc6_ = true;
               }
            }
            if(_loc6_)
            {
               return param1;
            }
         }
         return StringUtil._capitalizeFirstLetter(param1);
      }
      
      protected static function _isIgnoredWord(param1:String) : Boolean
      {
         var _loc2_:int = param1.indexOf(".");
         var _loc3_:int = StringUtil.indexOfUpperCase(param1);
         if(_loc2_ != -1 && _loc2_ != param1.length - 1 || _loc3_ != -1 && _loc3_ != 0)
         {
            return true;
         }
         return false;
      }
      
      protected static function _isSmallWord(param1:String) : Boolean
      {
         return StringUtil.SMALL_WORDS.indexOf(StringUtil.getLettersFromString(param1).toLowerCase()) > -1;
      }
      
      protected static function _capitalizeFirstLetter(param1:String) : String
      {
         var _loc2_:int = -1;
         while(++_loc2_ < param1.length)
         {
            if(!StringUtil.isPunctuation(param1.charAt(_loc2_)))
            {
               return StringUtil.replaceAt(param1,_loc2_,param1.charAt(_loc2_).toUpperCase());
            }
         }
         return param1;
      }
      
      public static function uuid() : String
      {
         var _loc1_:Array = new Array("8","9","A","B");
         return StringUtil.createRandomIdentifier(8,15) + "-" + StringUtil.createRandomIdentifier(4,15) + "-4" + StringUtil.createRandomIdentifier(3,15) + "-" + _loc1_[NumberUtil.randomIntegerWithinRange(0,3)] + StringUtil.createRandomIdentifier(3,15) + "-" + StringUtil.createRandomIdentifier(12,15);
      }
      
      public static function createRandomIdentifier(param1:uint, param2:uint = 61) : String
      {
         var _loc3_:Array = new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
         var _loc4_:Array = new Array();
         param2 = param2 > 61?uint(61):uint(param2);
         while(param1--)
         {
            _loc4_.push(_loc3_[NumberUtil.randomIntegerWithinRange(0,param2)]);
         }
         return _loc4_.join("");
      }
      
      public static function autoLink(param1:String, param2:String = "_blank", param3:String = null) : String
      {
         var _loc4_:RegExp = /\b(([\w-]+\:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/g;
         param3 = param3 != "" && param3 != null?" class=\"" + param3 + "\"":"";
         param2 = param2 != null?" target=\"" + param2 + "\"":"";
         return param1.replace(_loc4_,"<a href=\"$1\"" + param2 + param3 + ">$1</a>");
      }
      
      public static function htmlEncode(param1:String) : String
      {
         return new XML(new XMLNode(XMLNodeType.TEXT_NODE,param1)).toXMLString();
      }
      
      public static function htmlDecode(param1:String) : String
      {
         return new XMLDocument(param1).firstChild.nodeValue;
      }
      
      public static function isPunctuation(param1:String, param2:Boolean = true) : Boolean
      {
         if(StringUtil.getNumbersFromString(param1).length != 0 || StringUtil.getLettersFromString(param1).length != 0)
         {
            return false;
         }
         if(!param2)
         {
            return param1.split(" ").length == 1;
         }
         return true;
      }
      
      public static function isUpperCase(param1:String) : Boolean
      {
         if(param1 != param1.toUpperCase())
         {
            return false;
         }
         return true;
      }
      
      public static function isLowerCase(param1:String) : Boolean
      {
         if(param1 != param1.toLowerCase())
         {
            return false;
         }
         return true;
      }
      
      public static function isNumber(param1:String) : Boolean
      {
         var _loc2_:String = StringUtil.trim(param1);
         if(_loc2_.length < param1.length || param1.length == 0)
         {
            return false;
         }
         return !isNaN(Number(param1));
      }
      
      public static function indexOfUpperCase(param1:String, param2:uint = 0) : int
      {
         var _loc3_:Array = param1.split("");
         var _loc4_:int = param2 - 1;
         while(++_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == _loc3_[_loc4_].toUpperCase() && _loc3_[_loc4_] != _loc3_[_loc4_].toLowerCase())
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public static function indexOfLowerCase(param1:String, param2:uint = 0) : int
      {
         var _loc3_:Array = param1.split("");
         var _loc4_:int = param2 - 1;
         while(++_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == _loc3_[_loc4_].toLowerCase() && _loc3_[_loc4_] != _loc3_[_loc4_].toUpperCase())
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public static function getNumbersFromString(param1:String) : String
      {
         var _loc2_:RegExp = /[^0-9]/g;
         return param1.replace(_loc2_,"");
      }
      
      public static function getLettersFromString(param1:String) : String
      {
         var _loc2_:RegExp = /[[:digit:]|[:punct:]|\s]/g;
         return param1.replace(_loc2_,"");
      }
      
      public static function contains(param1:String, param2:String) : uint
      {
         var _loc3_:RegExp = new RegExp(param2,"g");
         return param1.match(_loc3_).length;
      }
      
      public static function trimLeft(param1:String, param2:String = " \t\n\r") : String
      {
         var _loc3_:RegExp = new RegExp("^[" + param2 + "]+","");
         return param1.replace(_loc3_,"");
      }
      
      public static function trimRight(param1:String, param2:String = " \t\n\r") : String
      {
         var _loc3_:RegExp = new RegExp("[" + param2 + "]+$","");
         return param1.replace(_loc3_,"");
      }
      
      public static function trim(param1:String, param2:String = " \t\n\r") : String
      {
         var _loc3_:RegExp = new RegExp("^[" + param2 + "]+|[" + param2 + "]+$","g");
         return param1.replace(_loc3_,"");
      }
      
      public static function removeExtraSpaces(param1:String) : String
      {
         var _loc2_:RegExp = /( )+/g;
         return StringUtil.trim(param1.replace(_loc2_," ")," ");
      }
      
      public static function removeWhitespace(param1:String) : String
      {
         var _loc2_:RegExp = new RegExp("[" + StringUtil.WHITESPACE + "]","g");
         return param1.replace(_loc2_,"");
      }
      
      public static function remove(param1:String, param2:String) : String
      {
         return StringUtil.replace(param1,param2,"");
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function removeAt(param1:String, param2:int) : String
      {
         return StringUtil.replaceAt(param1,param2,"");
      }
      
      public static function replaceAt(param1:String, param2:int, param3:String) : String
      {
         var _loc4_:Array = param1.split("");
         _loc4_.splice(param2,1,param3);
         return _loc4_.join("");
      }
      
      public static function addAt(param1:String, param2:int, param3:String) : String
      {
         var _loc4_:Array = param1.split("");
         _loc4_.splice(param2,0,param3);
         return _loc4_.join("");
      }
      
      public static function getWordCount(param1:String) : uint
      {
         return StringUtil.removeExtraSpaces(StringUtil.trim(param1)).split(" ").length;
      }
      
      public static function getUniqueCharacters(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:String = "";
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1.charAt(_loc3_);
            if(_loc2_.indexOf(_loc4_) == -1)
            {
               _loc2_ = _loc2_ + _loc4_;
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
