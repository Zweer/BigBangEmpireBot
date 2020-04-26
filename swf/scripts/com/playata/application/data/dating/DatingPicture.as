package com.playata.application.data.dating
{
   public class DatingPicture
   {
       
      
      public var datingIndex:int;
      
      public var datingStep:int;
      
      public var isAllowed:Boolean;
      
      public function DatingPicture(param1:int, param2:int, param3:Boolean)
      {
         super();
         this.datingIndex = param1;
         this.datingStep = param2;
         this.isAllowed = param3;
      }
   }
}
