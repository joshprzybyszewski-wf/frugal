// Autogenerated by Frugal Compiler (2.23.0)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



import 'dart:async';

import 'dart:typed_data' show Uint8List;
import 'package:logging/logging.dart' as logging;
import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:some_vendored_place/vendor_namespace.dart' as t_vendor_namespace;
import 'package:excepts/excepts.dart' as t_excepts;
import 'package:include_vendor/include_vendor.dart' as t_include_vendor;


abstract class FMyService extends t_vendor_namespace.FVendoredBase {
  Future<t_vendor_namespace.Item> getItem(frugal.FContext ctx);
}

class FMyServiceClient extends t_vendor_namespace.FVendoredBaseClient implements FMyService {
  static final logging.Logger _frugalLog = new logging.Logger('MyService');
  Map<String, frugal.FMethod> _methods;

  FMyServiceClient(frugal.FServiceProvider provider, [List<frugal.Middleware> middleware])
      : super(provider, middleware) {
    _transport = provider.transport;
    _protocolFactory = provider.protocolFactory;
    var combined = middleware ?? [];
    combined.addAll(provider.middleware);
    this._methods = {};
    this._methods['getItem'] = new frugal.FMethod(this._getItem, 'MyService', 'getItem', combined);
  }

  frugal.FTransport _transport;
  frugal.FProtocolFactory _protocolFactory;

  @override
  Future<t_vendor_namespace.Item> getItem(frugal.FContext ctx) {
    return this._methods['getItem']([ctx]) as Future<t_vendor_namespace.Item>;
  }

  Future<t_vendor_namespace.Item> _getItem(frugal.FContext ctx) async {
    var memoryBuffer = new frugal.TMemoryOutputBuffer(_transport.requestSizeLimit);
    var oprot = _protocolFactory.getProtocol(memoryBuffer);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(new thrift.TMessage("getItem", thrift.TMessageType.CALL, 0));
    getItem_args args = new getItem_args();
    args.write(oprot);
    oprot.writeMessageEnd();
    var response = await _transport.request(ctx, memoryBuffer.writeBytes);

    var iprot = _protocolFactory.getProtocol(response);
    iprot.readResponseHeader(ctx);
    thrift.TMessage msg = iprot.readMessageBegin();
    if (msg.type == thrift.TMessageType.EXCEPTION) {
      thrift.TApplicationError error = thrift.TApplicationError.read(iprot);
      iprot.readMessageEnd();
      if (error.type == frugal.FrugalTTransportErrorType.REQUEST_TOO_LARGE) {
        throw new thrift.TTransportError(
            frugal.FrugalTTransportErrorType.RESPONSE_TOO_LARGE, error.message);
      }
      throw error;
    }

    getItem_result result = new getItem_result();
    result.read(iprot);
    iprot.readMessageEnd();
    if (result.success != null) {
      return result.success;
    }

    if (result.d != null) {
      throw result.d;
    }
    throw new thrift.TApplicationError(
      frugal.FrugalTApplicationErrorType.MISSING_RESULT, "getItem failed: unknown result"
    );
  }
}

// ignore: camel_case_types
class getItem_args implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("getItem_args");



  getItem_args() {}

  @override
  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  @override
  bool isSet(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  read(thrift.TProtocol iprot) {
    iprot.readStructBegin();
    for (thrift.TField field = iprot.readFieldBegin();
        field.type != thrift.TType.STOP;
        field = iprot.readFieldBegin()) {
      switch (field.id) {
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    validate();
  }

  @override
  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @override
  String toString() {
    StringBuffer ret = new StringBuffer("getItem_args(");

    ret.write(")");

    return ret.toString();
  }

  @override
  bool operator ==(Object o) {
    return o is getItem_args;
  }

  @override
  int get hashCode {
    var value = 17;
    return value;
  }

  getItem_args clone() {
    return new getItem_args();
  }

  validate() {
  }
}
// ignore: camel_case_types
class getItem_result implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("getItem_result");
  static final thrift.TField _SUCCESS_FIELD_DESC = new thrift.TField("success", thrift.TType.STRUCT, 0);
  static final thrift.TField _D_FIELD_DESC = new thrift.TField("d", thrift.TType.STRUCT, 1);

  t_vendor_namespace.Item success;
  static const int SUCCESS = 0;
  t_excepts.InvalidData d;
  static const int D = 1;


  getItem_result() {
  }

  @deprecated
  bool isSetSuccess() => success != null;

  @deprecated
  unsetSuccess() => success = null;

  @deprecated
  bool isSetD() => d != null;

  @deprecated
  unsetD() => d = null;

  @override
  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return this.success;
      case D:
        return this.d;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case SUCCESS:
        if (value == null) {
          success = null;
        } else if (value is t_vendor_namespace.Item) {
          success = value;
        }

        break;

      case D:
        if (value == null) {
          d = null;
        } else if (value is t_excepts.InvalidData) {
          d = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  @override
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return success != null;

      case D:
        return d != null;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  read(thrift.TProtocol iprot) {
    iprot.readStructBegin();
    for (thrift.TField field = iprot.readFieldBegin();
        field.type != thrift.TType.STOP;
        field = iprot.readFieldBegin()) {
      switch (field.id) {
        case SUCCESS:
          if (field.type == thrift.TType.STRUCT) {
            success = new t_vendor_namespace.Item();
            success.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case D:
          if (field.type == thrift.TType.STRUCT) {
            d = new t_excepts.InvalidData();
            d.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    validate();
  }

  @override
  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if (success != null) {
      oprot.writeFieldBegin(_SUCCESS_FIELD_DESC);
      success.write(oprot);
      oprot.writeFieldEnd();
    }
    if (d != null) {
      oprot.writeFieldBegin(_D_FIELD_DESC);
      d.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @override
  String toString() {
    StringBuffer ret = new StringBuffer("getItem_result(");

    if (success != null) {
      ret.write("success:");
      if (this.success == null) {
        ret.write("null");
      } else {
        ret.write(this.success);
      }
    }

    if (d != null) {
      ret.write(", ");
      ret.write("d:");
      if (this.d == null) {
        ret.write("null");
      } else {
        ret.write(this.d);
      }
    }

    ret.write(")");

    return ret.toString();
  }

  @override
  bool operator ==(Object o) {
    if (o is getItem_result) {
      return this.success == o.success &&
        this.d == o.d;
    }
    return false;
  }

  @override
  int get hashCode {
    var value = 17;
    value = (value * 31) ^ success.hashCode;
    value = (value * 31) ^ d.hashCode;
    return value;
  }

  getItem_result clone({
    t_vendor_namespace.Item success: null,
    t_excepts.InvalidData d: null,
  }) {
    return new getItem_result()
      ..success = success ?? this.success
      ..d = d ?? this.d;
  }

  validate() {
  }
}
