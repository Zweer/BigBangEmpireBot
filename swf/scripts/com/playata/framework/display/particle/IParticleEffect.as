package com.playata.framework.display.particle
{
   import com.playata.framework.display.IDisplayObject;
   
   public interface IParticleEffect extends IDisplayObject
   {
       
      
      function start(param1:Number = 0) : void;
      
      function stop(param1:Boolean = false) : void;
      
      function pause() : void;
      
      function resume() : void;
      
      function reset() : Boolean;
      
      function get isPlaying() : Boolean;
      
      function get numParticles() : int;
      
      function get cycleDuration() : Number;
      
      function get emissionRate() : Number;
      
      function set emissionRate(param1:Number) : void;
      
      function get emitAngle() : Number;
      
      function set emitAngle(param1:Number) : void;
      
      function set emitAngleAlignedRotation(param1:Boolean) : void;
      
      function get emitAngleAlignedRotation() : Boolean;
      
      function get emitAngleVariance() : Number;
      
      function set emitAngleVariance(param1:Number) : void;
      
      function get emitterType() : int;
      
      function set emitterType(param1:int) : void;
      
      function get emitterObject() : Object;
      
      function set emitterObject(param1:Object) : void;
      
      function get emitterX() : Number;
      
      function set emitterX(param1:Number) : void;
      
      function get emitterXVariance() : Number;
      
      function set emitterXVariance(param1:Number) : void;
      
      function get emitterY() : Number;
      
      function set emitterY(param1:Number) : void;
      
      function get emitterYVariance() : Number;
      
      function set emitterYVariance(param1:Number) : void;
      
      function get isEmitting() : Boolean;
      
      function get endColor() : uint;
      
      function set endColor(param1:uint) : void;
      
      function get endColorVariance() : uint;
      
      function set endColorVariance(param1:uint) : void;
      
      function get endRotation() : Number;
      
      function set endRotation(param1:Number) : void;
      
      function get endRotationVariance() : Number;
      
      function set endRotationVariance(param1:Number) : void;
      
      function get endSize() : Number;
      
      function set endSize(param1:Number) : void;
      
      function get endSizeVariance() : Number;
      
      function set endSizeVariance(param1:Number) : void;
      
      function get exactBounds() : Boolean;
      
      function set exactBounds(param1:Boolean) : void;
      
      function get fadeInTime() : Number;
      
      function set fadeInTime(param1:Number) : void;
      
      function get fadeOutTime() : Number;
      
      function set fadeOutTime(param1:Number) : void;
      
      function get gravityX() : Number;
      
      function set gravityX(param1:Number) : void;
      
      function get gravityY() : Number;
      
      function set gravityY(param1:Number) : void;
      
      function get lifespan() : Number;
      
      function set lifespan(param1:Number) : void;
      
      function get lifespanVariance() : Number;
      
      function set lifespanVariance(param1:Number) : void;
      
      function get maxNumParticles() : uint;
      
      function set maxNumParticles(param1:uint) : void;
      
      function get maxRadius() : Number;
      
      function set maxRadius(param1:Number) : void;
      
      function get maxRadiusVariance() : Number;
      
      function set maxRadiusVariance(param1:Number) : void;
      
      function get minRadius() : Number;
      
      function set minRadius(param1:Number) : void;
      
      function get minRadiusVariance() : Number;
      
      function set minRadiusVariance(param1:Number) : void;
      
      function get premultipliedAlpha() : Boolean;
      
      function set premultipliedAlpha(param1:Boolean) : void;
      
      function get radialAcceleration() : Number;
      
      function set radialAcceleration(param1:Number) : void;
      
      function get radialAccelerationVariance() : Number;
      
      function set radialAccelerationVariance(param1:Number) : void;
      
      function get randomStartFrames() : Boolean;
      
      function set randomStartFrames(param1:Boolean) : void;
      
      function get rotatePerSecond() : Number;
      
      function set rotatePerSecond(param1:Number) : void;
      
      function get rotatePerSecondVariance() : Number;
      
      function set rotatePerSecondVariance(param1:Number) : void;
      
      function get startColor() : uint;
      
      function set startColor(param1:uint) : void;
      
      function get startColorVariance() : uint;
      
      function set startColorVariance(param1:uint) : void;
      
      function get startSize() : Number;
      
      function set startSize(param1:Number) : void;
      
      function get startSizeVariance() : Number;
      
      function set startSizeVariance(param1:Number) : void;
      
      function get startRotation() : Number;
      
      function set startRotation(param1:Number) : void;
      
      function get startRotationVariance() : Number;
      
      function set startRotationVariance(param1:Number) : void;
      
      function get spawnTime() : Number;
      
      function set spawnTime(param1:Number) : void;
      
      function get speed() : Number;
      
      function set speed(param1:Number) : void;
      
      function get speedVariance() : Number;
      
      function set speedVariance(param1:Number) : void;
      
      function get tangentialAcceleration() : Number;
      
      function set tangentialAcceleration(param1:Number) : void;
      
      function get tangentialAccelerationVariance() : Number;
      
      function set tangentialAccelerationVariance(param1:Number) : void;
      
      function get tinted() : Boolean;
      
      function set tinted(param1:Boolean) : void;
   }
}
