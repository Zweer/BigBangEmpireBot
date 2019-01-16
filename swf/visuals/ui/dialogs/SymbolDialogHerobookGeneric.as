package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookCompleteGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookInfoGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookLineGeneric;
   
   public class SymbolDialogHerobookGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogHerobook = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var line1:SymbolHerobookLineGeneric = null;
      
      public var line2:SymbolHerobookLineGeneric = null;
      
      public var line3:SymbolHerobookLineGeneric = null;
      
      public var line4:SymbolHerobookLineGeneric = null;
      
      public var line5:SymbolHerobookLineGeneric = null;
      
      public var goalInfo:SymbolHerobookInfoGeneric = null;
      
      public var goalComplete:SymbolHerobookCompleteGeneric = null;
      
      public function SymbolDialogHerobookGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogHerobook;
         }
         else
         {
            _nativeObject = new SymbolDialogHerobook();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         line1 = new SymbolHerobookLineGeneric(_nativeObject.line1);
         line2 = new SymbolHerobookLineGeneric(_nativeObject.line2);
         line3 = new SymbolHerobookLineGeneric(_nativeObject.line3);
         line4 = new SymbolHerobookLineGeneric(_nativeObject.line4);
         line5 = new SymbolHerobookLineGeneric(_nativeObject.line5);
         goalInfo = new SymbolHerobookInfoGeneric(_nativeObject.goalInfo);
         goalComplete = new SymbolHerobookCompleteGeneric(_nativeObject.goalComplete);
      }
      
      public function setNativeInstance(param1:SymbolDialogHerobook) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.goalInfo)
         {
            goalInfo.setNativeInstance(_nativeObject.goalInfo);
         }
         if(_nativeObject.goalComplete)
         {
            goalComplete.setNativeInstance(_nativeObject.goalComplete);
         }
      }
   }
}
