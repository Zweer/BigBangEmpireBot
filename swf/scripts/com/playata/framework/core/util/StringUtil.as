package com.playata.framework.core.util
{
   import com.playata.framework.core.error.Exception;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   
   public class StringUtil
   {
       
      
      public function StringUtil()
      {
         super();
         throw new Exception("This class may not be instantiated directly. Use its static functions instead.");
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 === null || param2 === null || param3 === null)
         {
            return param1;
         }
         if(param1 && param1.indexOf(param2) == -1)
         {
            return param1;
         }
         var _loc9_:String = new String();
         var _loc4_:Boolean = false;
         var _loc5_:int = param1.length;
         var _loc6_:int = param2.length;
         _loc7_ = 0;
         for(; _loc7_ < _loc5_; _loc7_++)
         {
            if(param1.charAt(_loc7_) == param2.charAt(0))
            {
               _loc4_ = true;
               _loc8_ = 0;
               while(_loc8_ < _loc6_)
               {
                  if(param1.charAt(_loc7_ + _loc8_) != param2.charAt(_loc8_))
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc8_++;
               }
               if(_loc4_)
               {
                  _loc9_ = _loc9_ + param3;
                  _loc7_ = _loc7_ + (_loc6_ - 1);
                  continue;
               }
            }
            _loc9_ = _loc9_ + param1.charAt(_loc7_);
         }
         return _loc9_;
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 === null)
         {
            return param1;
         }
         return StringUtil.ltrim(StringUtil.rtrim(param1));
      }
      
      public static function ltrim(param1:String) : String
      {
         var _loc3_:int = 0;
         if(param1 === null)
         {
            return param1;
         }
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1.charCodeAt(_loc3_) > 32)
            {
               return param1.substring(_loc3_);
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function rtrim(param1:String) : String
      {
         var _loc3_:* = 0;
         if(param1 === null)
         {
            return param1;
         }
         var _loc2_:int = param1.length;
         _loc3_ = _loc2_;
         while(_loc3_ > 0)
         {
            if(param1.charCodeAt(_loc3_ - 1) > 32)
            {
               return param1.substring(0,_loc3_);
            }
            _loc3_--;
         }
         return "";
      }
      
      public static function remove(param1:String, param2:String) : String
      {
         if(param1 === null || param2 === null)
         {
            return param1;
         }
         return StringUtil.replace(param1,param2,"");
      }
      
      public static function isEmpty(param1:String) : Boolean
      {
         if(param1 === null)
         {
            return true;
         }
         return StringUtil.trim(param1) == "";
      }
      
      public static function startsWith(param1:String, param2:String) : Boolean
      {
         if(param1 === null || param2 === null)
         {
            return false;
         }
         return param1.indexOf(param2) === 0;
      }
      
      public static function endsWith(param1:String, param2:String) : Boolean
      {
         if(param1 === null || param2 === null)
         {
            return false;
         }
         return param2 == param1.substring(param1.length - param2.length);
      }
      
      public static function cutLength(param1:String, param2:int) : String
      {
         if(param1 === null)
         {
            return param1;
         }
         if(param1.length <= param2 + 3)
         {
            return param1;
         }
         return param1.substr(0,param2) + "...";
      }
      
      public static function countOccurences(param1:String, param2:String) : Number
      {
         var _loc4_:int = 0;
         if(param1 === null || param2 === null)
         {
            return 0;
         }
         var _loc3_:* = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(param1.charAt(_loc4_) == param2)
            {
               _loc3_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function replaceHtmlTagPart(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : String
      {
         var _loc10_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc7_:int = param1.indexOf(param2);
         while(_loc7_ != -1)
         {
            _loc10_ = param1.indexOf(param3,_loc7_);
            if(_loc10_ != -1)
            {
               _loc8_ = param1.substring(_loc7_,_loc10_ + param3.length);
               if(_loc8_)
               {
                  _loc9_ = _loc8_;
                  _loc9_ = StringUtil.replace(_loc9_,param2,param5);
                  _loc9_ = StringUtil.replace(_loc9_,param3,param6);
                  param1 = param1.replace(_loc8_,_loc9_);
                  _loc7_ = param1.indexOf(param2);
                  continue;
               }
               break;
            }
            break;
         }
         param1 = StringUtil.replace(param1,param4,"");
         return param1;
      }
      
      public static function replaceHtmlFontColorTagPart(param1:String, param2:String, param3:String, param4:String, param5:String = "[[color=", param6:String = "]]") : String
      {
         var _loc11_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc8_:int = param1.indexOf(param2);
         var _loc12_:int = -1;
         var _loc7_:Vector.<String> = new Vector.<String>();
         while(_loc8_ != -1)
         {
            _loc11_ = param1.indexOf(param3,_loc8_);
            if(_loc11_ != -1)
            {
               _loc9_ = param1.substring(_loc8_,_loc11_ + param3.length);
               if(_loc9_)
               {
                  _loc10_ = _loc9_;
                  _loc10_ = StringUtil.replace(_loc10_,param2,param5);
                  _loc10_ = StringUtil.replace(_loc10_,param3,param6);
                  param1 = param1.replace(_loc9_,_loc10_);
                  _loc8_ = param1.indexOf(param2);
                  _loc7_.push(_loc10_);
                  _loc12_ = param1.indexOf(param4);
                  if(_loc12_ != -1 && _loc12_ < _loc8_ && _loc7_.length > 1)
                  {
                     _loc7_.pop();
                     param1 = param1.replace(param4,_loc7_[_loc7_.length - 1]);
                     _loc8_ = param1.indexOf(param2);
                  }
                  continue;
               }
               break;
            }
            break;
         }
         while(_loc12_ != -1 && _loc7_.length > 1)
         {
            _loc7_.pop();
            param1 = param1.replace(param4,_loc7_[_loc7_.length - 1]);
            _loc12_ = param1.indexOf(param4);
         }
         param1 = StringUtil.replace(param1,param4,"");
         return param1;
      }
      
      public static function removeHtmlTag(param1:String, param2:String, param3:String, param4:String) : String
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = param1.indexOf(param2);
         while(_loc5_ != -1)
         {
            _loc7_ = param1.indexOf(param3,_loc5_);
            if(_loc7_ != -1)
            {
               _loc6_ = param1.substring(_loc5_,_loc7_ + param3.length);
               if(_loc6_)
               {
                  param1 = param1.replace(_loc6_,"");
                  _loc5_ = param1.indexOf(param2);
                  continue;
               }
               break;
            }
            break;
         }
         param1 = StringUtil.replace(param1,param4,"");
         return param1;
      }
      
      public static function leftPad(param1:String, param2:int, param3:String = " ") : String
      {
         var _loc4_:* = null;
         if(param1.length < param2)
         {
            _loc4_ = "";
            while(_loc4_.length + param1.length < param2)
            {
               _loc4_ = _loc4_ + param3;
            }
            return _loc4_ + param1;
         }
         return param1;
      }
      
      public static function rightPad(param1:String, param2:int, param3:String = " ") : String
      {
         while(param1.length < param2)
         {
            param1 = param1 + param3;
         }
         return param1;
      }
      
      public static function hexColorToUint(param1:String) : uint
      {
         var _loc2_:RegExp = new RegExp(/#/g);
         var _loc3_:uint = String(param1).replace(_loc2_,"0x");
         return _loc3_;
      }
      
      public static function htmlEscape(param1:String) : String
      {
         return XML(new XMLNode(3,param1)).toXMLString();
      }
      
      public static function htmlUnescape(param1:String) : String
      {
         return new XMLDocument(param1).firstChild.nodeValue;
      }
      
      public static function capitaliseFirstLetter(param1:String) : String
      {
         return param1.substring(0,1).toUpperCase() + param1.substr(1,param1.length - 1);
      }
      
      public static function isValidEmail(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^[a-z0-9][-._a-z0-9]*@([a-z0-9][-_a-z0-9]*\.)+[a-z]{2,10}$/;
         return _loc2_.test(param1);
      }
      
      public static function formatBytes(param1:uint, param2:int = 1) : String
      {
         var _loc3_:Vector.<String> = new <String>["B","KB","MB","GB","TB"];
         var _loc5_:int = 0;
         var _loc4_:Number = param1;
         while(_loc4_ >= 1024 && _loc5_ < _loc3_.length)
         {
            _loc4_ = _loc4_ / 1024;
            _loc5_++;
         }
         _loc4_ = NumberUtil.roundDecimal(_loc4_,param2);
         return _loc4_ + _loc3_[_loc5_];
      }
   }
}
