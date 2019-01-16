package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.duel.SymbolButtonDuelHistoryGeneric;
   import visuals.ui.elements.duel.SymbolDuelContentGeneric;
   import visuals.ui.elements.duel.SymbolHonorPanelGeneric;
   
   public class SymbolPanelDuelsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelDuels = null;
      
      public var content:SymbolDuelContentGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnDuelHistory:SymbolButtonDuelHistoryGeneric = null;
      
      public var honorPanel:SymbolHonorPanelGeneric = null;
      
      public function SymbolPanelDuelsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelDuels;
         }
         else
         {
            _nativeObject = new SymbolPanelDuels();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         content = new SymbolDuelContentGeneric(_nativeObject.content);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnDuelHistory = new SymbolButtonDuelHistoryGeneric(_nativeObject.btnDuelHistory);
         honorPanel = new SymbolHonorPanelGeneric(_nativeObject.honorPanel);
      }
      
      public function setNativeInstance(param1:SymbolPanelDuels) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnDuelHistory)
         {
            btnDuelHistory.setNativeInstance(_nativeObject.btnDuelHistory);
         }
         if(_nativeObject.honorPanel)
         {
            honorPanel.setNativeInstance(_nativeObject.honorPanel);
         }
      }
   }
}
