package com.playata.application.data.marriage
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOMarriageLookup;
   
   public class Marriage extends DOMarriageLookup
   {
       
      
      public function Marriage(param1:Object = null)
      {
         super(param1);
      }
      
      override public function get otherCharacterName() : String
      {
         return Character.getCleanName(super.otherCharacterName);
      }
      
      public function get isCharacterDeleted() : Boolean
      {
         return super.otherCharacterName.indexOf("___") != -1;
      }
   }
}
