package com.playata.framework.localization
{
   import com.playata.application.AppConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.StringUtil;
   
   public class LocText implements IAsset
   {
      
      public static var current:LocText = null;
       
      
      private var _gender:int = 0;
      
      private var _textCache:StringMap;
      
      private var _locale:String = null;
      
      private var _data:TypedObject = null;
      
      public function LocText(param1:TypedObject, param2:String)
      {
         _textCache = new StringMap();
         super();
         Logger.debug("[LocText] Init text localization...");
         setData(param1,param2);
      }
      
      public function dispose() : void
      {
         Logger.debug("[LocText] Destroy localization...");
         _data = null;
         _locale = null;
      }
      
      public function set gender(param1:int) : void
      {
         _gender = param1;
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function setData(param1:TypedObject, param2:String) : void
      {
         Logger.debug("[LocText] Setting new data for localization system...");
         _data = param1;
         _locale = param2;
         _textCache = new StringMap();
      }
      
      public function addData(param1:TypedObject) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.rawData;
         for(var _loc2_ in param1.rawData)
         {
            _data.setData(_loc2_,param1.rawData[_loc2_]);
            if(_textCache.exists(_loc2_))
            {
               _textCache.remove(_loc2_);
            }
         }
      }
      
      public function hasText(param1:String) : Boolean
      {
         return _data.hasData(param1);
      }
      
      public function text(param1:String, ... rest) : String
      {
         var _loc12_:int = 0;
         var _loc15_:* = null;
         var _loc19_:* = null;
         var _loc16_:* = null;
         var _loc5_:int = 0;
         var _loc21_:Number = NaN;
         var _loc17_:Boolean = false;
         var _loc20_:* = null;
         var _loc10_:* = null;
         var _loc22_:* = null;
         var _loc18_:* = null;
         var _loc13_:* = null;
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(_data == null)
         {
            throw new Exception("Error in LocText! No text data has been set!");
         }
         if(!_data.hasData(param1))
         {
            return param1;
         }
         var _loc14_:String = null;
         var _loc11_:String = _data.getString(param1);
         if(Environment.platform.isNaughtyEmpire)
         {
            _loc11_ = StringUtil.replace(_loc11_,"Playata GmbH","3X Entertainment Ltd.");
         }
         if(rest.length == 0 && _loc11_.indexOf("[m:") == -1 && _loc11_.indexOf("[f:") == -1 && _loc11_.indexOf("[touch:") == -1 && _loc11_.indexOf("[desktop:") == -1 && _loc11_.indexOf("<font color=\"quality") == -1 && _loc11_.indexOf("[APPLICATION_NAME]") == -1)
         {
            if(_textCache.exists(param1))
            {
               return _textCache.getData(param1);
            }
            _loc14_ = new String(_data.getString(param1));
            if(Environment.platform.isNaughtyEmpire)
            {
               _loc14_ = StringUtil.replace(_loc14_,"Playata GmbH","3X Entertainment Ltd.");
            }
            _loc14_ = StringUtil.replace(_loc14_,"[percent]","%");
            _textCache.setData(param1,_loc14_);
            return _loc14_;
         }
         _loc14_ = new String(_data.getString(param1));
         if(Environment.platform.isNaughtyEmpire)
         {
            _loc14_ = StringUtil.replace(_loc14_,"Playata GmbH","3X Entertainment Ltd.");
         }
         _loc12_ = rest.length;
         while(_loc12_ > 0)
         {
            if(_loc14_.search("%" + _loc12_) == -1)
            {
               Logger.debug("[LocText] Error in LocText! [Key: " + param1 + "][Value: " + _data.getString(param1) + "] Parameter %" + _loc12_ + " does not exist.");
            }
            else if(_loc14_.indexOf("[v:%" + _loc12_) == -1)
            {
               _loc15_ = rest[_loc12_ - 1].toString();
               _loc15_ = StringUtil.replace(_loc15_,"%","___%___");
               _loc14_ = _loc14_.split("%" + _loc12_).join(_loc15_);
            }
            else
            {
               _loc19_ = "[v:%" + _loc12_;
               while(_loc14_.indexOf(_loc19_) != -1)
               {
                  _loc16_ = getParameterString(_loc14_,_loc12_);
                  _loc5_ = parseInt(StringUtil.replace(StringUtil.replace(rest[_loc12_ - 1].toString(),text("base/numbers/comma_separator"),""),text("base/numbers/thousands_separator"),""));
                  _loc21_ = parseFloat(StringUtil.replace(StringUtil.replace(rest[_loc12_ - 1].toString(),text("base/numbers/comma_separator"),"."),text("base/numbers/thousands_separator"),""));
                  _loc17_ = !!(_loc21_ % 1)?true:false;
                  _loc20_ = "";
                  if(_loc17_ || isNaN(_loc21_))
                  {
                     _loc20_ = getPluralForm(_loc16_,_loc5_,rest[_loc12_ - 1].toString());
                  }
                  else
                  {
                     _loc20_ = getPluralForm(_loc16_,_loc5_,formatHugeNumber(_loc21_));
                  }
                  _loc14_ = _loc14_.replace(_loc16_,_loc20_);
               }
            }
            _loc12_--;
         }
         _loc14_ = StringUtil.replace(_loc14_,"___%___","%");
         var _loc6_:int = _gender;
         while(_loc14_.indexOf("[m:") != -1 || _loc14_.indexOf("[f:") != -1)
         {
            _loc10_ = null;
            _loc22_ = "";
            _loc18_ = "";
            if(_loc14_.indexOf("[m:") != -1)
            {
               _loc10_ = _loc14_.substring(_loc14_.indexOf("[m:"));
               _loc22_ = _loc14_.substring(_loc14_.indexOf("[m:") + 3);
               if(_loc22_.indexOf("|f:") != -1 && _loc22_.indexOf("]") != -1)
               {
                  _loc18_ = _loc22_.substring(_loc22_.indexOf("|f:") + 3);
                  _loc18_ = _loc18_.substring(0,_loc18_.indexOf("]"));
                  _loc22_ = _loc22_.substring(0,_loc22_.indexOf("|f:"));
               }
               else if(_loc22_.indexOf("]") != -1)
               {
                  _loc22_ = _loc22_.substring(0,_loc22_.indexOf("]"));
               }
               else
               {
                  break;
               }
            }
            else
            {
               _loc10_ = _loc14_.substring(_loc14_.indexOf("[f:"));
               _loc18_ = _loc14_.substring(_loc14_.indexOf("[f:") + 3);
               if(_loc18_.indexOf("|m:") != -1 && _loc18_.indexOf("]") != -1)
               {
                  _loc22_ = _loc18_.substring(_loc18_.indexOf("|m:") + 3);
                  _loc22_ = _loc22_.substring(0,_loc22_.indexOf("]"));
                  _loc18_ = _loc18_.substring(0,_loc18_.indexOf("|m:"));
               }
               else if(_loc18_.indexOf("]") != -1)
               {
                  _loc18_ = _loc18_.substring(0,_loc18_.indexOf("]"));
               }
               else
               {
                  break;
               }
            }
            _loc10_ = _loc10_.substring(0,_loc10_.indexOf("]") + 1);
            if(_loc6_ == 2)
            {
               _loc14_ = StringUtil.replace(_loc14_,_loc10_,_loc18_);
            }
            else
            {
               _loc14_ = StringUtil.replace(_loc14_,_loc10_,_loc22_);
            }
         }
         while(_loc14_.indexOf("[touch:") != -1 || _loc14_.indexOf("[desktop:") != -1)
         {
            _loc13_ = null;
            _loc9_ = "";
            _loc4_ = "";
            if(_loc14_.indexOf("[touch:") != -1)
            {
               _loc13_ = _loc14_.substring(_loc14_.indexOf("[touch:"));
               _loc9_ = _loc14_.substring(_loc14_.indexOf("[touch:") + "[touch:".length);
               if(_loc9_.indexOf("|desktop:") != -1 && _loc9_.indexOf("]") != -1)
               {
                  _loc4_ = _loc9_.substring(_loc9_.indexOf("|desktop:") + "[desktop:".length);
                  _loc4_ = _loc4_.substring(0,_loc4_.indexOf("]"));
                  _loc9_ = _loc9_.substring(0,_loc9_.indexOf("|desktop:"));
               }
               else if(_loc9_.indexOf("]") != -1)
               {
                  _loc9_ = _loc9_.substring(0,_loc9_.indexOf("]"));
               }
               else
               {
                  break;
               }
            }
            else
            {
               _loc13_ = _loc14_.substring(_loc14_.indexOf("[desktop:"));
               _loc4_ = _loc14_.substring(_loc14_.indexOf("[desktop:") + "[desktop:".length);
               if(_loc4_.indexOf("|touch:") != -1 && _loc4_.indexOf("]") != -1)
               {
                  _loc9_ = _loc4_.substring(_loc4_.indexOf("|touch:") + "|touch:".length);
                  _loc9_ = _loc9_.substring(0,_loc9_.indexOf("]"));
                  _loc4_ = _loc4_.substring(0,_loc4_.indexOf("|touch:"));
               }
               else if(_loc4_.indexOf("]") != -1)
               {
                  _loc4_ = _loc4_.substring(0,_loc4_.indexOf("]"));
               }
               else
               {
                  break;
               }
            }
            _loc13_ = _loc13_.substring(0,_loc13_.indexOf("]") + 1);
            if(!Core.current.info.isTouchScreen)
            {
               _loc14_ = StringUtil.replace(_loc14_,_loc13_,_loc4_);
            }
            else
            {
               _loc14_ = StringUtil.replace(_loc14_,_loc13_,_loc9_);
            }
         }
         while(_loc14_.indexOf("<font color=\"quality") != -1)
         {
            _loc3_ = null;
            _loc7_ = "";
            _loc8_ = 0;
            if(_loc14_.indexOf("\"quality_common\"") != -1)
            {
               _loc3_ = _loc14_.substring(_loc14_.indexOf("\"quality_common\""));
               _loc8_ = 16;
               _loc7_ = "\"#DADADA\"";
            }
            else if(_loc14_.indexOf("\"quality_rare\"") != -1)
            {
               _loc3_ = _loc14_.substring(_loc14_.indexOf("\"quality_rare\""));
               _loc8_ = 14;
               _loc7_ = "\"#0066FF\"";
            }
            else if(_loc14_.indexOf("\"quality_epic\"") != -1)
            {
               _loc3_ = _loc14_.substring(_loc14_.indexOf("\"quality_epic\""));
               _loc8_ = 14;
               _loc7_ = "\"#C800D0\"";
            }
            else
            {
               throw new Error("Error in LocText! Invalid Qualaity Parameter " + _loc14_.substring(_loc14_.indexOf("\"quality_"),_loc14_.indexOf(">")));
            }
            _loc3_ = _loc3_.substring(0,_loc8_);
            _loc14_ = StringUtil.replace(_loc14_,_loc3_,_loc7_);
         }
         _loc14_ = StringUtil.replace(_loc14_,"[percent]","%");
         _loc14_ = StringUtil.replace(_loc14_,"[APPLICATION_NAME]",AppConfig.appName);
         if(_locale == "cs_CZ")
         {
            if(_loc11_.indexOf(" v %") != -1 && _loc11_.indexOf(" hodin") != -1)
            {
               _loc14_ = StringUtil.replace(_loc14_," v 12"," ve 12");
               _loc14_ = StringUtil.replace(_loc14_," v 13"," ve 13");
               _loc14_ = StringUtil.replace(_loc14_," v 14"," ve 14");
               _loc14_ = StringUtil.replace(_loc14_," v 20"," ve 20");
               _loc14_ = StringUtil.replace(_loc14_," v 21"," ve 21");
               _loc14_ = StringUtil.replace(_loc14_," v 22"," ve 22");
               _loc14_ = StringUtil.replace(_loc14_," v 23"," ve 23");
            }
         }
         return _loc14_;
      }
      
      public function getParameterString(param1:String, param2:int, param3:String = null) : String
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc9_:String = "[v:%" + param2;
         if(param3 != null)
         {
            _loc9_ = "[v:" + param3;
         }
         if(param1.indexOf(_loc9_) == -1)
         {
            throw new Exception("Error in LocText! Value Parameter " + param2 + " not found!");
         }
         var _loc4_:String = param1.substr(param1.indexOf(_loc9_));
         var _loc5_:int = 0;
         var _loc6_:int = _loc9_.length;
         _loc8_ = _loc9_.length;
         while(_loc8_ < _loc4_.length)
         {
            _loc7_ = _loc4_.charAt(_loc8_);
            if(_loc7_ == "[")
            {
               _loc5_++;
            }
            else if(_loc7_ == "]" && _loc5_ > 0)
            {
               _loc5_--;
            }
            else if(_loc7_ == "]" && _loc5_ == 0)
            {
               break;
            }
            _loc6_++;
            _loc8_++;
         }
         _loc4_ = _loc4_.substr(0,_loc6_ + 1);
         return _loc4_;
      }
      
      public function getPluralForm(param1:String, param2:int, param3:String = null) : String
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         if(_data == null)
         {
            throw new Exception("Error in LocText! No text data has been set!");
         }
         if(param3 == null)
         {
            param3 = param2.toString();
         }
         var _loc9_:String = null;
         if(_locale == "pl_PL")
         {
            if(param2 == 0)
            {
               _loc9_ = "p2";
            }
            else if(param2 == 1)
            {
               _loc9_ = "s";
            }
            else if(param2 % 10 >= 2 && param2 % 10 <= 4 && (param2 % 100 < 10 || param2 % 100 >= 20))
            {
               _loc9_ = "p";
            }
            else
            {
               _loc9_ = "p2";
            }
         }
         else if(_locale == "cs_CZ")
         {
            if(param2 == 1)
            {
               _loc9_ = "s";
            }
            else if(param2 >= 2 && param2 <= 4)
            {
               _loc9_ = "p";
            }
            else
            {
               _loc9_ = "p2";
            }
         }
         else if(_locale == "ru_RU")
         {
            if(param2 % 10 == 1 && param2 % 100 != 11)
            {
               _loc9_ = "s";
            }
            else if(param2 % 10 >= 2 && param2 % 10 <= 4 && (param2 % 100 < 10 || param2 % 100 >= 20))
            {
               _loc9_ = "p";
            }
            else
            {
               _loc9_ = "p2";
            }
         }
         else if(_locale == "fr_FR")
         {
            if(param2 <= 1)
            {
               _loc9_ = "s";
            }
            else
            {
               _loc9_ = "p";
            }
         }
         else if(param2 == 1)
         {
            _loc9_ = "s";
         }
         else
         {
            _loc9_ = "p";
         }
         if(param1.indexOf("|" + _loc9_ + ":") == -1)
         {
            if(_loc9_ == "p2" && param1.indexOf("|p:") != -1)
            {
               _loc9_ = "p";
            }
            else
            {
               throw new Exception("Error in LocText! No plural data for key \'" + _loc9_ + "\' has been set!");
            }
         }
         var _loc4_:String = param1.substr(param1.indexOf("|" + _loc9_ + ":") + 2 + _loc9_.length);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc7_ = _loc4_.charAt(_loc8_);
            if(_loc7_ == "[")
            {
               _loc5_++;
            }
            else if(_loc7_ == "]" && _loc5_ > 0)
            {
               _loc5_--;
            }
            else if(_loc7_ == "]" || _loc7_ == "|" && _loc5_ == 0)
            {
               break;
            }
            _loc6_++;
            _loc8_++;
         }
         _loc4_ = _loc4_.substr(0,_loc6_);
         _loc4_ = _loc4_.replace("$v",param3);
         return _loc4_;
      }
      
      public function formatHugeNumber(param1:*, param2:Boolean = false) : String
      {
         var _loc8_:int = 0;
         if(_data == null)
         {
            throw new Exception("Error in LocText! No text data has been set!");
         }
         if(!_data.hasData("base/numbers/thousands_separator"))
         {
            throw new Exception("Error in LocText! Could not find mandatory key \'base/numbers/thousands_separator\' for current locale to apply number formatting!");
         }
         var _loc4_:String = "";
         if(param1 is int)
         {
            _loc8_ = param1;
         }
         else
         {
            _loc8_ = Math.floor(param1);
            _loc4_ = getDecimalString(param1);
         }
         var _loc5_:String = _loc8_.toString();
         if(param2 && _loc8_ > 0)
         {
            _loc5_ = "+" + _loc8_.toString();
         }
         if(param2 && _loc5_.length <= 4)
         {
            return _loc5_ + _loc4_;
         }
         if(_loc5_.length <= 3)
         {
            return _loc5_ + _loc4_;
         }
         _loc5_ = Math.abs(_loc8_).toString();
         var _loc9_:String = text("base/numbers/thousands_separator");
         var _loc6_:String = "";
         var _loc3_:uint = _loc5_.length % 3;
         var _loc7_:int = _loc3_;
         if(_loc3_ > 0)
         {
            _loc6_ = _loc5_.slice(0,_loc3_) + _loc9_;
         }
         while(_loc7_ < _loc5_.length)
         {
            _loc6_ = _loc6_ + _loc5_.slice(_loc7_,_loc7_ + 3);
            _loc7_ = _loc7_ + 3;
            if(_loc7_ < _loc5_.length)
            {
               _loc6_ = _loc6_ + _loc9_;
            }
         }
         if(param2 && _loc8_ > 0)
         {
            _loc6_ = "+" + _loc6_;
         }
         else if(_loc8_ < 0)
         {
            _loc6_ = "-" + _loc6_;
         }
         return _loc6_ + _loc4_;
      }
      
      private function getDecimalString(param1:Number) : String
      {
         if(Math.floor(param1) == param1)
         {
            return "";
         }
         var _loc2_:String = text("base/numbers/comma_separator");
         var _loc4_:String = param1.toString();
         var _loc3_:int = parseInt(_loc4_.substr(_loc4_.indexOf(_loc2_)));
         return _loc2_ + formatHugeNumber(_loc3_);
      }
      
      public function shortenHugeNumber(param1:Number) : String
      {
         if(_data == null)
         {
            throw new Exception("Error in LocText! No text data has been set!");
         }
         if(!_data.hasData("base/numbers/comma_separator"))
         {
            throw new Exception("Error in LocText! Could not find mandatory key \'base/numbers/comma_separator\' for current locale to apply number formatting!");
         }
         if(!_data.hasData("base/numbers/thousands_short"))
         {
            throw new Exception("Error in LocText! Could not find mandatory key \'base/numbers/thousands_short\' for current locale to apply number formatting!");
         }
         if(!_data.hasData("base/numbers/millions_short"))
         {
            throw new Exception("Error in LocText! Could not find mandatory key \'base/numbers/millions_short\' for current locale to apply number formatting!");
         }
         if(!_data.hasData("base/numbers/billions_short"))
         {
            throw new Exception("Error in LocText! Could not find mandatory key \'base/numbers/billions_short\' for current locale to apply number formatting!");
         }
         param1 = Math.floor(param1);
         var _loc4_:String = text("base/numbers/comma_separator");
         var _loc2_:String = param1.toString();
         var _loc3_:* = "";
         if(param1 < 0 && _loc2_.length < 5)
         {
            return _loc2_;
         }
         if(_loc2_.length < 4)
         {
            return _loc2_;
         }
         if(_loc2_.length == 4)
         {
            _loc3_ = text("base/numbers/thousands_short",_loc2_.charAt(0) + _loc4_ + _loc2_.charAt(1));
         }
         else if(_loc2_.length == 5)
         {
            _loc3_ = text("base/numbers/thousands_short",_loc2_.slice(0,2) + _loc4_ + _loc2_.charAt(2));
         }
         else if(_loc2_.length == 6)
         {
            _loc3_ = text("base/numbers/thousands_short",_loc2_.slice(0,3));
         }
         else if(_loc2_.length == 7)
         {
            _loc3_ = text("base/numbers/millions_short",_loc2_.charAt(0) + _loc4_ + _loc2_.charAt(1));
         }
         else if(_loc2_.length == 8)
         {
            _loc3_ = text("base/numbers/millions_short",_loc2_.slice(0,2) + _loc4_ + _loc2_.charAt(2));
         }
         else if(_loc2_.length == 9)
         {
            _loc3_ = text("base/numbers/millions_short",_loc2_.slice(0,3));
         }
         else if(_loc2_.length == 10)
         {
            _loc3_ = text("base/numbers/billions_short",_loc2_.charAt(0) + _loc4_ + _loc2_.charAt(1));
         }
         else if(_loc2_.length == 11)
         {
            _loc3_ = text("base/numbers/billions_short",_loc2_.slice(0,2) + _loc4_ + _loc2_.charAt(2));
         }
         else if(_loc2_.length == 12)
         {
            _loc3_ = text("base/numbers/billions_short",_loc2_.slice(0,3));
         }
         else
         {
            _loc3_ = _loc2_;
         }
         return _loc3_;
      }
      
      public function get locale() : String
      {
         return _locale;
      }
   }
}
