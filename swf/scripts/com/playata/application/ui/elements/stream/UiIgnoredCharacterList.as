package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.IgnoreMessageCharacter;
   import com.playata.application.data.stream.Streams;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.list.UiList;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolIgnoredCharacterListGeneric;
   
   public class UiIgnoredCharacterList extends UiList
   {
       
      
      private var _content:SymbolIgnoredCharacterListGeneric = null;
      
      public function UiIgnoredCharacterList(param1:SymbolIgnoredCharacterListGeneric)
      {
         _content = param1;
         _content.txtNoIgnores.text = LocText.current.text("dialog/mailbox_ignore/no_ignores");
         super(_content,UiIgnoredCharacterLine,13,new UiButton(_content.btnUp,null,null),new UiButton(_content.btnDown,null,null),true,false,sortByName,"line");
         onListUpdated.add(refreshUI);
      }
      
      public function refreshLocalization() : void
      {
         _content.txtNoIgnores.text = LocText.current.text("dialog/mailbox_ignore/no_ignores");
      }
      
      public function refreshUI(param1:List) : void
      {
         _content.txtNoIgnores.visible = itemCount == 0;
      }
      
      public function sync() : void
      {
         var _loc1_:Streams = User.current.character.streams;
         syncItemsFromVector(_loc1_.ignoredCharacters);
      }
      
      private function sortByName(param1:IgnoreMessageCharacter, param2:IgnoreMessageCharacter) : int
      {
         return AlphaNumericSortUtil.compare(param1.name,param2.name);
      }
   }
}
