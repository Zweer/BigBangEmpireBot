package visuals.ui.elements.generic
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.stats.SymbolStatBarGeneric;
   
   public class SymbolTooltipStatsGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolTooltipStats = null;
      
      public var backgroundImage:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtCompareValue:ILabel = null;
      
      public var barStrength:SymbolStatBarGeneric = null;
      
      public var barStamina:SymbolStatBarGeneric = null;
      
      public var barCriticalHitRating:SymbolStatBarGeneric = null;
      
      public var barDodgeRating:SymbolStatBarGeneric = null;
      
      public var avatarImage:SymbolAvatarImagePlaceholderGeneric = null;
      
      public function SymbolTooltipStatsGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTooltipStats;
         }
         else
         {
            _nativeObject = new SymbolTooltipStats();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundImage = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.backgroundImage);
         txtCompareValue = FlashLabel.fromNative(_nativeObject.txtCompareValue);
         barStrength = new SymbolStatBarGeneric(_nativeObject.barStrength);
         barStamina = new SymbolStatBarGeneric(_nativeObject.barStamina);
         barCriticalHitRating = new SymbolStatBarGeneric(_nativeObject.barCriticalHitRating);
         barDodgeRating = new SymbolStatBarGeneric(_nativeObject.barDodgeRating);
         avatarImage = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.avatarImage);
      }
      
      public function setNativeInstance(param1:SymbolTooltipStats) : void
      {
         FlashMovieClip.setNativeInstance(_movieClip,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      override public function play() : void
      {
         super.play();
         syncInstances();
      }
      
      override public function stop() : void
      {
         super.stop();
         syncInstances();
      }
      
      override public function gotoAndStop(param1:Object) : void
      {
         super.gotoAndStop(param1);
         syncInstances();
      }
      
      override public function gotoAndPlay(param1:Object) : void
      {
         _movieClip.gotoAndPlay(param1);
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundImage)
         {
            backgroundImage.setNativeInstance(_nativeObject.backgroundImage);
         }
         FlashLabel.setNativeInstance(txtCompareValue,_nativeObject.txtCompareValue);
         if(_nativeObject.barStrength)
         {
            barStrength.setNativeInstance(_nativeObject.barStrength);
         }
         if(_nativeObject.barStamina)
         {
            barStamina.setNativeInstance(_nativeObject.barStamina);
         }
         if(_nativeObject.barCriticalHitRating)
         {
            barCriticalHitRating.setNativeInstance(_nativeObject.barCriticalHitRating);
         }
         if(_nativeObject.barDodgeRating)
         {
            barDodgeRating.setNativeInstance(_nativeObject.barDodgeRating);
         }
         if(_nativeObject.avatarImage)
         {
            avatarImage.setNativeInstance(_nativeObject.avatarImage);
         }
      }
   }
}
