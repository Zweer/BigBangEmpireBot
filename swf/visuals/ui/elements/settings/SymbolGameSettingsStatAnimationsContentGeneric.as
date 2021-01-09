package visuals.ui.elements.settings
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   
   public class SymbolGameSettingsStatAnimationsContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGameSettingsStatAnimationsContent = null;
      
      public var checkShowDatingStatAnimation:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDatingStatAnimation:ILabelArea = null;
      
      public var txtShowQuestStatAnimation:ILabelArea = null;
      
      public var checkShowQuestStatAnimation:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDungeonStatAnimation:ILabelArea = null;
      
      public var checkShowDungeonStatAnimation:SymbolUiCheckboxGeneric = null;
      
      public var txtShowMovieStatAnimation:ILabelArea = null;
      
      public var checkShowMovieStatAnimation:SymbolUiCheckboxGeneric = null;
      
      public function SymbolGameSettingsStatAnimationsContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGameSettingsStatAnimationsContent;
         }
         else
         {
            _nativeObject = new SymbolGameSettingsStatAnimationsContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         checkShowDatingStatAnimation = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDatingStatAnimation);
         txtShowDatingStatAnimation = FlashLabelArea.fromNative(_nativeObject.txtShowDatingStatAnimation);
         txtShowQuestStatAnimation = FlashLabelArea.fromNative(_nativeObject.txtShowQuestStatAnimation);
         checkShowQuestStatAnimation = new SymbolUiCheckboxGeneric(_nativeObject.checkShowQuestStatAnimation);
         txtShowDungeonStatAnimation = FlashLabelArea.fromNative(_nativeObject.txtShowDungeonStatAnimation);
         checkShowDungeonStatAnimation = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDungeonStatAnimation);
         txtShowMovieStatAnimation = FlashLabelArea.fromNative(_nativeObject.txtShowMovieStatAnimation);
         checkShowMovieStatAnimation = new SymbolUiCheckboxGeneric(_nativeObject.checkShowMovieStatAnimation);
      }
      
      public function setNativeInstance(param1:SymbolGameSettingsStatAnimationsContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.checkShowDatingStatAnimation)
         {
            checkShowDatingStatAnimation.setNativeInstance(_nativeObject.checkShowDatingStatAnimation);
         }
         FlashLabelArea.setNativeInstance(txtShowDatingStatAnimation,_nativeObject.txtShowDatingStatAnimation);
         FlashLabelArea.setNativeInstance(txtShowQuestStatAnimation,_nativeObject.txtShowQuestStatAnimation);
         if(_nativeObject.checkShowQuestStatAnimation)
         {
            checkShowQuestStatAnimation.setNativeInstance(_nativeObject.checkShowQuestStatAnimation);
         }
         FlashLabelArea.setNativeInstance(txtShowDungeonStatAnimation,_nativeObject.txtShowDungeonStatAnimation);
         if(_nativeObject.checkShowDungeonStatAnimation)
         {
            checkShowDungeonStatAnimation.setNativeInstance(_nativeObject.checkShowDungeonStatAnimation);
         }
         FlashLabelArea.setNativeInstance(txtShowMovieStatAnimation,_nativeObject.txtShowMovieStatAnimation);
         if(_nativeObject.checkShowMovieStatAnimation)
         {
            checkShowMovieStatAnimation.setNativeInstance(_nativeObject.checkShowMovieStatAnimation);
         }
      }
   }
}
