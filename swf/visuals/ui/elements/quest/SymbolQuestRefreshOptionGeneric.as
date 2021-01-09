package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolQuestRefreshOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestRefreshOption = null;
      
      public var txtName:ILabel = null;
      
      public var btnRefresh:SymbolButtonPremiumGeneric = null;
      
      public var stageThumbnail:SymbolStageThumbnailGeneric = null;
      
      public function SymbolQuestRefreshOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestRefreshOption;
         }
         else
         {
            _nativeObject = new SymbolQuestRefreshOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         btnRefresh = new SymbolButtonPremiumGeneric(_nativeObject.btnRefresh);
         stageThumbnail = new SymbolStageThumbnailGeneric(_nativeObject.stageThumbnail);
      }
      
      public function setNativeInstance(param1:SymbolQuestRefreshOption) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.btnRefresh)
         {
            btnRefresh.setNativeInstance(_nativeObject.btnRefresh);
         }
         if(_nativeObject.stageThumbnail)
         {
            stageThumbnail.setNativeInstance(_nativeObject.stageThumbnail);
         }
      }
   }
}
