package visuals.ui.elements.streaming
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolStreamingRoomGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolStreamingRoom = null;
      
      public var settingBackground:SymbolPlaceholderGeneric = null;
      
      public var room1:SymbolIconStreamingRoom1Generic = null;
      
      public var roomImageLocked:SymboStreamingRoomLockedImageGeneric = null;
      
      public var roomLocked:SymbolStreamingRoomLockedGeneric = null;
      
      public var btnUnlockGameCurrency:SymbolButtonStreamingCurrencyGeneric = null;
      
      public var btnUnlockPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var btnStartStreamingShow:SymbolStreamingButtonStartGeneric = null;
      
      public var reward:SymbolStreamingRoomRewardGeneric = null;
      
      public var actor:SymbolPlaceholderGeneric = null;
      
      public var settingAssetButton:SymbolPlaceholderGeneric = null;
      
      public var settingAssetTop:SymbolPlaceholderGeneric = null;
      
      public var txtRecordingTimeLeft:ILabel = null;
      
      public var txtRecording:ILabel = null;
      
      public var room2:SymbolIconStreamingRoom2Generic = null;
      
      public var room3:SymbolIconStreamingRoom3Generic = null;
      
      public var room4:SymbolIconStreamingRoom4Generic = null;
      
      public var room5:SymbolIconStreamingRoom5Generic = null;
      
      public var room6:SymbolIconStreamingRoom6Generic = null;
      
      public function SymbolStreamingRoomGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingRoom;
         }
         else
         {
            _nativeObject = new SymbolStreamingRoom();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         settingBackground = new SymbolPlaceholderGeneric(_nativeObject.settingBackground);
         room1 = new SymbolIconStreamingRoom1Generic(_nativeObject.room1);
         roomImageLocked = new SymboStreamingRoomLockedImageGeneric(_nativeObject.roomImageLocked);
         roomLocked = new SymbolStreamingRoomLockedGeneric(_nativeObject.roomLocked);
         btnUnlockGameCurrency = new SymbolButtonStreamingCurrencyGeneric(_nativeObject.btnUnlockGameCurrency);
         btnUnlockPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockPremiumCurrency);
         btnStartStreamingShow = new SymbolStreamingButtonStartGeneric(_nativeObject.btnStartStreamingShow);
         reward = new SymbolStreamingRoomRewardGeneric(_nativeObject.reward);
         actor = new SymbolPlaceholderGeneric(_nativeObject.actor);
         settingAssetButton = new SymbolPlaceholderGeneric(_nativeObject.settingAssetButton);
         settingAssetTop = new SymbolPlaceholderGeneric(_nativeObject.settingAssetTop);
         txtRecordingTimeLeft = FlashLabel.fromNative(_nativeObject.txtRecordingTimeLeft);
         txtRecording = FlashLabel.fromNative(_nativeObject.txtRecording);
         room2 = new SymbolIconStreamingRoom2Generic(_nativeObject.room2);
         room3 = new SymbolIconStreamingRoom3Generic(_nativeObject.room3);
         room4 = new SymbolIconStreamingRoom4Generic(_nativeObject.room4);
         room5 = new SymbolIconStreamingRoom5Generic(_nativeObject.room5);
         room6 = new SymbolIconStreamingRoom6Generic(_nativeObject.room6);
      }
      
      public function setNativeInstance(param1:SymbolStreamingRoom) : void
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
         if(_nativeObject.settingBackground)
         {
            settingBackground.setNativeInstance(_nativeObject.settingBackground);
         }
         if(_nativeObject.room1)
         {
            room1.setNativeInstance(_nativeObject.room1);
         }
         if(_nativeObject.roomImageLocked)
         {
            roomImageLocked.setNativeInstance(_nativeObject.roomImageLocked);
         }
         if(_nativeObject.roomLocked)
         {
            roomLocked.setNativeInstance(_nativeObject.roomLocked);
         }
         if(_nativeObject.btnUnlockGameCurrency)
         {
            btnUnlockGameCurrency.setNativeInstance(_nativeObject.btnUnlockGameCurrency);
         }
         if(_nativeObject.btnUnlockPremiumCurrency)
         {
            btnUnlockPremiumCurrency.setNativeInstance(_nativeObject.btnUnlockPremiumCurrency);
         }
         if(_nativeObject.btnStartStreamingShow)
         {
            btnStartStreamingShow.setNativeInstance(_nativeObject.btnStartStreamingShow);
         }
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         if(_nativeObject.actor)
         {
            actor.setNativeInstance(_nativeObject.actor);
         }
         if(_nativeObject.settingAssetButton)
         {
            settingAssetButton.setNativeInstance(_nativeObject.settingAssetButton);
         }
         if(_nativeObject.settingAssetTop)
         {
            settingAssetTop.setNativeInstance(_nativeObject.settingAssetTop);
         }
         FlashLabel.setNativeInstance(txtRecordingTimeLeft,_nativeObject.txtRecordingTimeLeft);
         FlashLabel.setNativeInstance(txtRecording,_nativeObject.txtRecording);
         if(_nativeObject.room2)
         {
            room2.setNativeInstance(_nativeObject.room2);
         }
         if(_nativeObject.room3)
         {
            room3.setNativeInstance(_nativeObject.room3);
         }
         if(_nativeObject.room4)
         {
            room4.setNativeInstance(_nativeObject.room4);
         }
         if(_nativeObject.room5)
         {
            room5.setNativeInstance(_nativeObject.room5);
         }
         if(_nativeObject.room6)
         {
            room6.setNativeInstance(_nativeObject.room6);
         }
      }
   }
}
