package com.playata.application.data.titles
{
   import com.playata.application.data.character.Character;
   import com.playata.framework.localization.LocText;
   
   public class BlankTitle extends Title
   {
      
      public static const NO_TITLE:String = "";
       
      
      public function BlankTitle()
      {
         super("",{});
      }
      
      override public function get source() : int
      {
         return 0;
      }
      
      override public function getNameWithTitle(param1:String) : String
      {
         return param1;
      }
      
      override public function get isNew() : Boolean
      {
         return false;
      }
      
      override public function get infoSource() : String
      {
         return "";
      }
      
      override public function tooltipCollected(param1:Character) : String
      {
         return LocText.current.text("dialog/titles/delete");
      }
   }
}
