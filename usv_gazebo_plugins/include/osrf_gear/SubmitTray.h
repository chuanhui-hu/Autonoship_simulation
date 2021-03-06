// Generated by gencpp from file osrf_gear/SubmitTray.msg
// DO NOT EDIT!


#ifndef OSRF_GEAR_MESSAGE_SUBMITTRAY_H
#define OSRF_GEAR_MESSAGE_SUBMITTRAY_H

#include <ros/service_traits.h>


#include <osrf_gear/SubmitTrayRequest.h>
#include <osrf_gear/SubmitTrayResponse.h>


namespace osrf_gear
{

struct SubmitTray
{

typedef SubmitTrayRequest Request;
typedef SubmitTrayResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SubmitTray
} // namespace osrf_gear


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::osrf_gear::SubmitTray > {
  static const char* value()
  {
    return "02ca9d3d33cd5aa38b11d30b6d8538ae";
  }

  static const char* value(const ::osrf_gear::SubmitTray&) { return value(); }
};

template<>
struct DataType< ::osrf_gear::SubmitTray > {
  static const char* value()
  {
    return "osrf_gear/SubmitTray";
  }

  static const char* value(const ::osrf_gear::SubmitTray&) { return value(); }
};


// service_traits::MD5Sum< ::osrf_gear::SubmitTrayRequest> should match 
// service_traits::MD5Sum< ::osrf_gear::SubmitTray > 
template<>
struct MD5Sum< ::osrf_gear::SubmitTrayRequest>
{
  static const char* value()
  {
    return MD5Sum< ::osrf_gear::SubmitTray >::value();
  }
  static const char* value(const ::osrf_gear::SubmitTrayRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::osrf_gear::SubmitTrayRequest> should match 
// service_traits::DataType< ::osrf_gear::SubmitTray > 
template<>
struct DataType< ::osrf_gear::SubmitTrayRequest>
{
  static const char* value()
  {
    return DataType< ::osrf_gear::SubmitTray >::value();
  }
  static const char* value(const ::osrf_gear::SubmitTrayRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::osrf_gear::SubmitTrayResponse> should match 
// service_traits::MD5Sum< ::osrf_gear::SubmitTray > 
template<>
struct MD5Sum< ::osrf_gear::SubmitTrayResponse>
{
  static const char* value()
  {
    return MD5Sum< ::osrf_gear::SubmitTray >::value();
  }
  static const char* value(const ::osrf_gear::SubmitTrayResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::osrf_gear::SubmitTrayResponse> should match 
// service_traits::DataType< ::osrf_gear::SubmitTray > 
template<>
struct DataType< ::osrf_gear::SubmitTrayResponse>
{
  static const char* value()
  {
    return DataType< ::osrf_gear::SubmitTray >::value();
  }
  static const char* value(const ::osrf_gear::SubmitTrayResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // OSRF_GEAR_MESSAGE_SUBMITTRAY_H
