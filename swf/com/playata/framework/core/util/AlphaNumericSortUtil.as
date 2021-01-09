package com.playata.framework.core.util
{
   public class AlphaNumericSortUtil
   {
      
      private static var sChunk:String = null;
      
      private static var sChar:String = null;
       
      
      public function AlphaNumericSortUtil()
      {
         super();
      }
      
      private static function isDigit(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      private static function getChunk(param1:String, param2:int, param3:int) : String
      {
         sChunk = "";
         sChar = param1.charAt(param3);
         sChunk = sChunk + sChar;
         param3++;
         if(isDigit(sChar))
         {
            while(param3 < param2)
            {
               sChar = param1.charAt(param3);
               if(isDigit(sChar))
               {
                  sChunk = sChunk + sChar;
                  param3++;
                  continue;
               }
               break;
            }
         }
         else
         {
            while(param3 < param2)
            {
               sChar = param1.charAt(param3);
               if(!isDigit(sChar))
               {
                  sChunk = sChunk + sChar;
                  param3++;
                  continue;
               }
               break;
            }
         }
         return sChunk;
      }
      
      public static function compare(param1:String, param2:String) : int
      {
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = param1.length;
         var _loc5_:int = param2.length;
         var _loc7_:String = null;
         var _loc9_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         while(_loc6_ < _loc11_ && _loc10_ < _loc5_)
         {
            _loc7_ = getChunk(param1,_loc11_,_loc6_);
            _loc6_ = _loc6_ + _loc7_.length;
            _loc9_ = getChunk(param2,_loc5_,_loc10_);
            _loc10_ = _loc10_ + _loc9_.length;
            _loc3_ = 0;
            if(isDigit(_loc7_.charAt(0)) && isDigit(_loc9_.charAt(0)))
            {
               _loc4_ = _loc7_.length;
               _loc3_ = _loc4_ - _loc9_.length;
               if(_loc3_ == 0)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc4_)
                  {
                     _loc3_ = _loc7_.charCodeAt(_loc8_) - _loc9_.charCodeAt(_loc8_);
                     if(_loc3_ != 0)
                     {
                        return _loc3_;
                     }
                     _loc8_++;
                  }
               }
            }
            else if(_loc7_ < _loc9_)
            {
               _loc3_ = -1;
            }
            else if(_loc7_ > _loc9_)
            {
               _loc3_ = 1;
            }
            else
            {
               _loc3_ = 0;
            }
            if(_loc3_ != 0)
            {
               return _loc3_;
            }
         }
         return _loc11_ - _loc5_;
      }
   }
}
