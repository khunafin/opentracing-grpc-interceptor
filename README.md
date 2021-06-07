# opentracing-grpc-interceptor


### Usage example
```php
use Grpc\Internal\InterceptorChannel;
use OpenTracingInterceptor\Interceptor;
use Acme\Tracer;
use Foo\Bar\SomeGrpcClient;
use Foo\Bar\SomeGrpcMethodArgs;

$host = 'grpc.server.com:1313';
$tracer =  new Tracer();

$channel = SomeGrpcClient::getDefaultChannel($host);
$openTracingInterceptor = new Interceptor($tracer);
$interceptor = new InterceptorChannel($channel, $openTracingInterceptor);

$rootSpan = $tracer->startSpan("rootSpan");

$client = new SomeGrpcClient($host, [], $interceptor);
$args = new SomeGrpcMethodArgs();
$options = [
    'child_of' => $rootSpan
];
$result = $client->SomeGrpcMethodCall($args, [], $options);

$rootSpan->finish();
$tracer->flush();
```

## Reference

[OpenTracing](https://opentracing.io/)

[Jaeger](https://uber.github.io/jaeger/)
